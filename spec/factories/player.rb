FactoryGirl.define do
  factory :player do
    base_id { Faker::PhoneNumber.subscriber_number }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    name { first_name }
    position { Player::POSITIONS.sample }
    is_gk { position == 'GK' }
    position_full { position }
    is_special_type { false }
    item_type { 'player' }
    fifa_id { base_id }
    height { Faker::Number.between(160, 200)  }
    weight { Faker::Number.between(70, 100) }
    birthdate { Faker::Date.between(40.years.ago, 18.years.ago) }
    age { Time.now.year - birthdate.year }
    acceleration { Faker::Number.between(30, 90) }
    aggression { Faker::Number.between(30, 90) }
    agility { Faker::Number.between(30, 90) }
    balance { Faker::Number.between(30, 90) }
    ballcontrol { Faker::Number.between(30, 90) }
    foot { %w(Left Right).sample }
    skillMoves { Faker::Number.between(1, 5) }
    crossing { Faker::Number.between(30, 90) }
    curve { Faker::Number.between(30, 90) }
    dribbling { Faker::Number.between(30, 90) }
    finishing { Faker::Number.between(30, 90) }
    freekickaccuracy { Faker::Number.between(30, 90) }
    gkdiving { Faker::Number.between(30, 90) }
    gkhandling { Faker::Number.between(30, 90) }
    gkkicking { Faker::Number.between(30, 90) }
    gkpositioning { Faker::Number.between(30, 90) }
    gkreflexes { Faker::Number.between(30, 90) }
    headingaccuracy { Faker::Number.between(30, 90) }
    interceptions { Faker::Number.between(30, 90) }
    jumping { Faker::Number.between(30, 90) }
    longpassing { Faker::Number.between(30, 90) }
    longshots { Faker::Number.between(30, 90) }
    marking { Faker::Number.between(30, 90) }
    penalties { Faker::Number.between(30, 90) }
    positioning { Faker::Number.between(30, 90) }
    potential { Faker::Number.between(30, 90) }
    reactions { Faker::Number.between(30, 90) }
    shortpassing { Faker::Number.between(30, 90) }
    shotpower { Faker::Number.between(30, 90) }
    slidingtackle { Faker::Number.between(30, 90) }
    sprintspeed { Faker::Number.between(30, 90) }
    standingtackle { Faker::Number.between(30, 90) }
    stamina { Faker::Number.between(30, 90) }
    strength { Faker::Number.between(30, 90) }
    vision { Faker::Number.between(30, 90) }
    volleys { Faker::Number.between(30, 90) }
    weak_foot { Faker::Number.between(1, 5) }
    attribute_1 { Faker::Number.between(30, 90) }
    attribute_2 { Faker::Number.between(30, 90) }
    attribute_3 { Faker::Number.between(30, 90) }
    attribute_4 { Faker::Number.between(30, 90) }
    attribute_5 { Faker::Number.between(30, 90) }
    attribute_6 { Faker::Number.between(30, 90) }
    atk_work_rate { %w(Low Medium High).sample }
    def_work_rate { %w(Low Medium High).sample }
    player_type { %w(rare standard).sample }
    quality { %w(bronze silver gold).sample }
    color { %w(bronze silver gold rare_bronze rare_silver rare_gold).sample }
    rating { Faker::Number.between(60, 90) }
    league
    nation
    club
  end
end
