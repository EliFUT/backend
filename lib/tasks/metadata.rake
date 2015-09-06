desc "Import clubs, countries and leagues data from JSON dumps"
task :import_metadata => :environment do
  data_dir = ENV['ELIFUT_DATA_DIRECTORY']

  unless data_dir.present?
    raise "Data dir not defined. Please set an ELIFUT_DATA_DIRECTORY env variable"
  end

  json = JSON.parse(File.open(File.join(data_dir, "types.json")).read)
  json['types'].each do |t|
    if t['searchParamName'] == 'country'
      t['typeMap'].each do |k, v|
        next if Nation.find_by(base_id: k).present?
        Nation.create(base_id: k, name: v)
      end
    elsif t['searchParamName'] == 'club'
      t['typeMap'].each do |k, v|
        next if Club.find_by(base_id: k).present?
        Club.create(base_id: k, name: v)
      end
    elsif t['searchParamName'] == 'league'
      t['typeMap'].each do |k, v|
        next if League.find_by(base_id: k).present?
        League.create(base_id: k, name: v)
      end
    end
  end
end

task :assign_relationships => :environment do
  data_dir = ENV['ELIFUT_DATA_DIRECTORY']

  unless data_dir.present?
    raise "Data dir not defined. Please set an ELIFUT_DATA_DIRECTORY env variable"
  end

  json = JSON.parse(File.open(File.join(data_dir, "display.json")).read)
  json['filterLogic'][2]['sections'].each do |section|
    league = League.where(name: section['name']).first
    unless league
      puts "League not found #{section['name']}"
      next
    end
    section['idList'].each do |club_id|
      club = Club.find_by(base_id: club_id)
      club.update_attribute(:league_id, league.id)
    end
  end
end
