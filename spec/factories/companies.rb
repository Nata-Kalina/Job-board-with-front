FactoryBot.define do
  factory :company do
    title { Faker::Company.name }
    about { Faker::Lorem.sentence(word_count: 12) }
    industry { Faker::Company.industry }
    website { Faker::Internet.domain_name }
    email { Faker::Internet.email }
    phone { Faker::Number.number(digits: 10) }
    linkedin { "https://www.linkedin.com/in/#{Faker::Internet.username}" }
    association :user
  end
end
