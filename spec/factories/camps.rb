FactoryBot.define do
  factory :camp do
    name { Faker::Alphanumeric.unique.alpha(number: 10) }
    association(:city)
  end
end