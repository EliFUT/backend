FactoryGirl.define do
  factory :nation do
    name { Faker::Address.country }
    base_id { Faker::PhoneNumber.subscriber_number }
  end
end
