FactoryBot.define do
  factory :admin  do
    phone_number  { Faker::PhoneNumber.cell_phone_in_e164 }
    password      { Faker::Internet.password(min_length: 8) }

    trait :with_invalid_phone do
      phone_number { '' }
    end

    trait :with_invalid_password do
      password { '' }
    end
  end
end
