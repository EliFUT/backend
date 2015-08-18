desc "Import clubs, countries and leagues data from JSON dumps"
task :import_metadata => :environment do
  json = JSON.parse(File.open("#{Rails.root}/dumps/types.json").read)
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
