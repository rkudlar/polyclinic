FactoryBot.define do
  factory :category do
    name  { Faker::Job.position }
  end
end
