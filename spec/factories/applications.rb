FactoryBot.define do
  factory :application do |f|
    f.resume { 'https://docs.google.com/document/u/0/' }
    f.status { 'applied' }
    association :account
    association :job
  end
end
