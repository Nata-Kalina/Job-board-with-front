FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    application_deadline { Faker::Date.forward(days: 30) }
    requirements { Faker::Lorem.sentence(word_count: 10) }
    responsibilities { Faker::Lorem.sentence(word_count: 10) }
    salary { Faker::Number.number(digits: 5) }
    association :company
  end
end
