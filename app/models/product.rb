class Product < ApplicationRecord
  belongs_to :store
  has_many :items, dependent: :destroy
  has_many :orders, through: :items

  has_one_attached :photo
end
