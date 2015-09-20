desc "Import players data from JSON dumps"
task :import_players_db => :environment do
  data_dir = ENV['ELIFUT_DATA_DIRECTORY']

  unless data_dir.present?
    raise "Data dir not defined. Please set an ELIFUT_DATA_DIRECTORY env variable"
  end

  players_dir = File.join(data_dir, "players")
  Dir.entries(players_dir).each do |f|
    if f.end_with?('.json')
      json = JSON.parse(File.open(File.join(players_dir, f)).read)
      json['items'].each do |p|
        club = Club.find_by(base_id: p['club']['id'])
        if club.present? && club.abbrev_name.nil?
          club_abbr_name = p['club']['abbrName']
          club.update_attribute(:abbrev_name, club_abbr_name)
        end
        player = Player.find_by(base_id: p['baseId'])
        args = {
          "first_name" => p['firstName'],
          "last_name" => p['lastName'],
          "common_name" => p['commonName'],
          "league_id" => p['league']['id'],
          "nation_id" => p['nation']['id'],
          "club_id" => p['club']['id'],
          "position" => p['position'],
          "play_style" => p['playStyle'],
          "height" => p['height'],
          "weight" => p['weight'],
          "birthdate" => p['birthdate'],
          "age" => p['age'],
          "acceleration" => p['acceleration'],
          "aggression" => p['aggression'],
          "agility" => p['agility'],
          "balance" => p['balance'],
          "ballcontrol" => p['ballcontrol'],
          "foot" => p['foot'],
          "skillMoves" => p['skillMoves'],
          "crossing" => p['crossing'],
          "curve" => p['curve'],
          "dribbling" => p['dribbling'],
          "finishing" => p['finishing'],
          "freekickaccuracy" => p['freekickaccuracy'],
          "gkdiving" => p['gkdiving'],
          "gkhandling" => p['gkhandling'],
          "gkkicking" => p['gkkicking'],
          "gkpositioning" => p['gkpositioning'],
          "gkreflexes" => p['gkreflexes'],
          "headingaccuracy" => p['headingaccuracy'],
          "interceptions" => p['interceptions'],
          "jumping" => p['jumping'],
          "longpassing" => p['longpassing'],
          "longshots" => p['longshots'],
          "marking" => p['marking'],
          "penalties" => p['penalties'],
          "positioning" => p['positioning'],
          "potential" => p['potential'],
          "reactions" => p['reactions'],
          "shortpassing" => p['shortpassing'],
          "shotpower" => p['shotpower'],
          "slidingtackle" => p['slidingtackle'],
          "sprintspeed" => p['sprintspeed'],
          "standingtackle" => p['standingtackle'],
          "stamina" => p['stamina'],
          "strength" => p['strength'],
          "vision" => p['vision'],
          "volleys" => p['volleys'],
          "weak_foot" => p['weakFoot'],
          "traits" => p['traits'],
          "specialities" => p['specialities'],
          "atk_work_rate" => p['atkWorkRate'],
          "def_work_rate" => p['defWorkRate'],
          "player_type" => p['playerType'],
          "attribute_1" => p['attributes'][0]['value'],
          "attribute_2" => p['attributes'][1]['value'],
          "attribute_3" => p['attributes'][2]['value'],
          "attribute_4" => p['attributes'][3]['value'],
          "attribute_5" => p['attributes'][4]['value'],
          "attribute_6" => p['attributes'][5]['value'],
          "name" => p['name'],
          "quality" => p['quality'],
          "color" => p['color'],
          "is_gk" => p['isGK'],
          "position_full" => p['positionFull'],
          "is_special_type" => p['isSpecialType'],
          "item_type" => p['itemType'],
          "fifa_id" => p['id'],
          "base_id" => p['baseId'],
          "rating" => p['rating']
        }
        if player.nil?
          Player.create(args)
        else
          player.update_attributes(args)
        end
      end
      puts f
    end
  end
end

task :import_players_images => :environment do
  src_base_url = "http://fifa15.content.easports.com/fifa/fltOnlineAssets/B488919F-23B5-497F-9FC0-CACFB38863D0/2016/fut/items/images"
  data_dir = ENV['ELIFUT_DATA_DIRECTORY']

  unless data_dir.present?
    raise "Data dir not defined. Please set an ELIFUT_DATA_DIRECTORY env variable"
  end

  out_path = File.join(data_dir, "images/players")

  Parallel.map(Player.find_each) do |p|
    file_path = "#{out_path}/player_#{p.base_id}.png"
    unless File.exist?(file_path)
      putc "."
      `curl -f -s -# "#{src_base_url}/players/html5/120x120/#{p.base_id}.png" -o "#{file_path}"`
    end
  end
end

task :import_players_json => :environment do
  data_dir = ENV['ELIFUT_DATA_DIRECTORY']

  unless data_dir.present?
    raise "Data dir not defined. Please set an ELIFUT_DATA_DIRECTORY env variable"
  end

  out_path = File.join(data_dir, "players")
  total_pages = 569

  1.upto(total_pages) do |page|
    out_file = File.join(out_path, "players_#{page}.json")
    putc "."
    `curl -f -s -# "https://www.easports.com/fifa/ultimate-team/api/fut/item?jsonParamObject=%7B%22page%22:#{page}%7D" -o "#{out_file}"`
  end
end
