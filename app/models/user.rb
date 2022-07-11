class User < ApplicationRecord
  has_many :records
  has_many :doctors, through: :records

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :phone_number, uniqueness: true, presence: true
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
