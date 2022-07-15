class Record < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  scope :status, -> { where(status: true) }

  def user_name
    user.name
  end

  def user_surname
    user.surname
  end

  def user_phone
    user.phone_number
  end

  def doctor_name
    doctor.name
  end

  def doctor_surname
    doctor.surname
  end

  def doctor_phone
    doctor.phone_number
  end

  def doctor_category
    doctor.category.name
  end

  def doctor_id
    doctor.id
  end

  def doctor_avatar
    doctor.avatar_picture
  end

  def count_active_doctor_records
    doctor.records.status.size
  end
end
