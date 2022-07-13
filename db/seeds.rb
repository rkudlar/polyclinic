if Rails.env.development?
  Admin.create([{ phone_number: '+380662896895', password: 'password' }])
  User.create([{ phone_number: '+380661122333', password: 'password',
                 name: Faker::Name.first_name, surname: Faker::Name.last_name }])
  User.create([{ phone_number: '+380501122333', password: 'password',
                 name: Faker::Name.first_name, surname: Faker::Name.last_name }])
  Category.create([{ name: 'Психолог' }])
  Category.create([{ name: 'Терапевт' }])
  Category.create([{ name: 'Кардіолог' }])
  Category.create([{ name: 'Лор' }])
  doctors = [
    {
      phone_number: '+380501112223', password: 'password',
      name: Faker::Name.first_name, surname: Faker::Name.last_name, category_id: 1
    },
    {
      phone_number: '+380661112223', password: 'password',
      name: Faker::Name.first_name, surname: Faker::Name.last_name, category_id: 1
    },
    {
      phone_number: '+380971112223', password: 'password',
      name: Faker::Name.first_name, surname: Faker::Name.last_name, category_id: 2
    },
    {
      phone_number: '+380991112223', password: 'password',
      name: Faker::Name.first_name, surname: Faker::Name.last_name, category_id: 3
    }
  ]
  doctors.map do |item|
    doctor = Doctor.new(phone_number: item[:phone_number], password: item[:password], name: item[:name],
                        surname: item[:surname], category_id: item[:category_id])
    doctor.avatar_picture.attach(io: File.open(Rails.root.join('db/seeds_img/icon-256x256.png')),
                                 filename: 'icon-256x256.png')
    doctor.save!
  end
end
