FactoryBot.define do
  factory :record do
    association :doctor
    association :user
    status { 1 }
  end
end
