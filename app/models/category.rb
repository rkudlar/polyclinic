class Category < ApplicationRecord
  has_many :doctors, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
