class User < ApplicationRecord
  has_many :records
  has_many :doctors, through: :records, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :phone_number, uniqueness: true, presence: true
  validates :name, presence: true
  validates :surname, presence: true

  include DeviseHelper
end
