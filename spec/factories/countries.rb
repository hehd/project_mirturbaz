FactoryBot.define do
  factory :country do
    sequence(:name) {|n| Faker::Address.unique.country + "#{n}"}

    # factory country_with_regions do
    #   transient do
    #     regions_count {5}
    #   end
    #
    #   after(:create) do |country, evaluator|
    #     create_list(:region, evaluator.regions_count, country: country)
    #   end
    #
    # end
  end
end

#