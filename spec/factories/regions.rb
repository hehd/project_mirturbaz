FactoryBot.define do
  factory :region do
    sequence(:name) { |n| Faker::Address.unique.state + "#{n}"}
    association(:country)
  end
end