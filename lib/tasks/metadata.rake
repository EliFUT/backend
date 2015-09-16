SRC_BASE_URL = "http://fifa15.content.easports.com/fifa/fltOnlineAssets/8D941B48-51BB-4B87-960A-06A61A62EBC0/2015/fut/items/images"

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
      unless club
        puts "Club not found with base_id #{club_id}"
        next
      end
      club.update_attribute(:league_id, league.id)
    end
  end
end

task :download_clubs_images => :environment do
  data_dir = ENV['ELIFUT_DATA_DIRECTORY']
  Club.find_each do |club|
    id = club.base_id
    normal_image_path = File.join(data_dir, "images/clubs/normal/club_#{id}.png")
    large_image_path = File.join(data_dir, "images/clubs/large/club_#{id}.png")
    unless File.exist?(normal_image_path)
      `curl -f -s -# "#{SRC_BASE_URL}/clubbadges/html5/normal/44x44/l#{id}.png" -o "#{normal_image_path}"`
    end
    unless File.exist?(large_image_path)
      `curl -f -s -# "#{SRC_BASE_URL}/clubbadges/web/s#{id}.png" -o "#{large_image_path}"`
    end
  end
end
