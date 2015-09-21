FactoryGirl.define do
  factory :club do
    name { Faker::Address.city }
    base_id { Faker::PhoneNumber.subscriber_number }
    league
  end
end
