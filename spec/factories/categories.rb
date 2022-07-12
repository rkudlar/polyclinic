FactoryBot.define do
  factory :category do
    id    { 1 }
    name  { Faker::Job.position }
  end
end
