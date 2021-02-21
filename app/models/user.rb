class User < ApplicationRecord
  has_secure_password
  has_one :doctor
  validates :email, :uniqueness => true
end
