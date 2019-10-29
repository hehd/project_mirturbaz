FactoryBot.define do
  factory :city do
    sequence(:name) { |n| Faker::Address.unique.city + "#{n}" }
    association(:region)


    transient do
      camps_count {10}
    end

    after(:create) do |city, evaluator|
      create_list(:camp, evaluator.camps_count, city: city)
    end
  end
end