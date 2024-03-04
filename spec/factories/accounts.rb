FactoryBot.define do
  factory :account do |f|
      f.first_name { Faker::Name.first_name }
      f.last_name { Faker::Name.last_name }
      f.phone { Faker::Number.number(digits: 10) }
      association :user
  end
end
