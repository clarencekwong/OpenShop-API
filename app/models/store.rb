class Store < ApplicationRecord
  has_many :products
  belongs_to :vendor
  has_one_attached :photo
end
