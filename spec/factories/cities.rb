FactoryBot.define do
  factory :city do
    name { Faker::Address.unique.city }
    association(:region)
  end
end