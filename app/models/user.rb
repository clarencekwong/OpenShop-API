class User < ApplicationRecord
  has_many :orders
  has_many :transactions
  validates :email, uniqueness: true
	has_secure_password
end
