Admin.create([{ phone_number: '+380662896895', password: 'password' }]) if Rails.env.development?
User.create([{ phone_number: '+380507144064', password: 'password' }]) if Rails.env.development?
