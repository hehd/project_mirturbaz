FactoryBot.define do
  factory :camp do
    sequence(:name) { |n| Faker::Alphanumeric.unique.alpha(number: 10) + "#{n}" }
    description           { Faker::Movies::Hobbit.quote }
    price                 { Faker::Number.within(range: 1000..10000) }
    association(:city)
  end
end