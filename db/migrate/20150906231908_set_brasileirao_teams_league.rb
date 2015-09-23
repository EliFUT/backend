class SetBrasileiraoTeamsLeague < ActiveRecord::Migration
  def change
    brasileirao_id = League.find_by(name: "Brasileirão").id
    ["Atlético Mineiro",
    "Atlético Paranaense",
    "Bahia",
    "Botafogo",
    "Chapecoense",
    "Corinthians",
    "Coritiba",
    "Criciúma",
    "Cruzeiro",
    "Figueirense",
    "Flamengo",
    "Goiás",
    "Grêmio",
    "Internacional",
    "Santos",
    "Sport",
    "São Paulo",
    "Vitória"].each do |name|
      club = Club.find_by(name: name)
      club.update_attribute(:league_id, brasileirao_id) if club
    end
  end
end
