FactoryGirl.define do
  factory :league do
    name { Faker::Company.name }
    base_id { Faker::PhoneNumber.subscriber_number }
    nation
  end
end
