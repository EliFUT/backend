desc "Assign nation IDs to Leagues"
task :assign_nations => :environment do
  leagues_to_nations = {
    "Campeonato Scotiabank"=>"Chile",
    "Österreichische Fußball-Bundesliga"=>"Austria",
    "Raiffeisen Super League"=>"Switzerland",
    "T-Mobile Ekstraklasa"=>"Poland",
    "Liga do Brasil"=>"Brazil",
    "SSE Airtricity League"=>"Republic of Ireland",
    "Hyundai A-League"=>"Cook Islands",
    "K LEAGUE Classic"=>"Kuwait",
    "Football League 1"=>"England",
    "Football League 2"=>"England",
    "Liga BBVA"=>"Spain",
    "Bundesliga"=>"Germany",
    "Barclays Premier League"=>"England",
    "Free Agents"=>"Germany",
    "Rest of World"=>"Georgia",
    "Süper Lig"=>"Turkey",
    "Ligue 1"=>"France",
    "Serie A TIM"=>"Italy",
    "Eredivisie"=>"Holland",
    "Abdul Latif Jameel League"=>"Singapore",
    "FIFA Career Saved Teams"=>"Greece",
    "Ligue 2"=>"France",
    "Liga Dimayor"=>"Colombia",
    "Alka Superliga"=>"Denmark",
    "Football League Championship"=>"England",
    "Liga Adelante"=>"Spain",
    "Belgium Pro League"=>"Belgium",
    "Major League Soccer"=>"United States",
    "Serie B"=>"Italy",
    "Sogaz Russian Football Championship"=>"Russia",
    "Tippeligaen"=>"Norway",
    "Scottish Premiership"=>"Scotland",
    "Allsvenskan"=>"Sweden",
    "Primera División"=>"Argentina",
    "Bundesliga 2"=>"Germany",
    "LIGA Bancomer MX"=>"Mexico"
  }
  leagues_to_nations.each do |k, v|
    league = League.find_by(name: k)
    nation = Nation.find_by(name: v)
    if nation.present? && league.present?
      league.update_attribute(:nation_id, nation.id)
    end
  end
end
