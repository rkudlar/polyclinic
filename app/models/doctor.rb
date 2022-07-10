class Doctor < ApplicationRecord
  has_one_attached :avatar_picture
  belongs_to :category

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :phone_number, uniqueness: true, presence: true
  validates :avatar_picture, content_type: %i[png jpg jpeg], attached: true
  validates :name, presence: true
  validates :surname, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
