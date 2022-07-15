class Doctor < ApplicationRecord
  has_one_attached :avatar_picture
  belongs_to :category
  has_many :records
  has_many :user, through: :records, dependent: :destroy

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :phone_number, uniqueness: true, presence: true
  validates :avatar_picture, content_type: %i[png jpg jpeg], attached: true
  validates :name, presence: true
  validates :surname, presence: true

  include DeviseHelper

  def count_active_records
    records.status.size
  end

  def category_name
    category.name
  end
end
