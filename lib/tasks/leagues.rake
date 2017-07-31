desc "Assign nation IDs to Leagues"
task :assign_nations => :environment do
  leagues_to_nations = {
    "AUT 1"=>"Austria",
    "CHI 1"=>"Chile",
    "SUI 1"=>"Switzerland",
    "POL 1"=>"Poland",
    "BRA 1"=>"Brazil",
    "IRL 1"=>"Republic of Ireland",
    "AUS 1"=>"Australia",
    "KOR 1"=>"South Korea",
    "ENG 1"=>"England",
    "ENG 2"=>"England",
    "ENG 3"=>"England",
    "ENG 4"=>"England",
    "ESP 1"=>"Spain",
    "ESP 2"=>"Spain",
    "GER 1"=>"Germany",
    "GER 2"=>"Germany",
    "TUR 1"=>"Turkey",
    "FRA 1"=>"France",
    "FIN 1"=>"Finland",
    "FRA 2"=>"France",
    "ITA 1"=>"Italy",
    "ITA 2"=>"Italy",
    "NED 1"=>"Holland",
    "POR 1"=>"Portugal",
    "COL 1"=>"Colombia",
    "DEN 1"=>"Denmark",
    "BEL 1"=>"Belgium",
    "SAU 1"=>"Saudi Arabia",
    "MLS"=>"United States",
    "RUS 1"=>"Russia",
    "NOR 1"=>"Norway",
    "SPFL"=>"Scotland",
    "SWE 1"=>"Sweden",
    "ARG 1"=>"Argentina",
    "MEX 1"=>"Mexico",
    "JPN 1"=>"Japan",
  }
  leagues_to_nations.each do |k, v|
    league = League.find_by(abbrev_name: k)
    nation = Nation.find_by(name: v)
    if nation.present? && league.present?
      league.update_attribute(:nation_id, nation.id)
    end
  end
end
