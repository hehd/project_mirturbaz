FactoryBot.define do
  factory :region do
    sequence(:name) { |n| Faker::Address.unique.state + "#{n}"}
    association(:country)

    transient do
      cities_count {5}
    end

    after(:create) do |region, evaluator|
      create_list(:city, evaluator.cities_count, region: region)
    end
  end
end