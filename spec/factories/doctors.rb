FactoryBot.define do
  factory :doctor do
    phone_number    { Faker::PhoneNumber.cell_phone_in_e164 }
    password        { Faker::Internet.password(min_length: 8) }
    name            { Faker::Name.first_name }
    surname         { Faker::Name.last_name }
    avatar_picture  { add_image('spec/support/assets/doctor/icon-256x256.png') }
    association :category
  end
end
