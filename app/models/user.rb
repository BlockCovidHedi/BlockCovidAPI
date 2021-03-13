class User < ApplicationRecord
  has_secure_password
  has_one :doctor
  has_one :establishment
  validates :email, :uniqueness => true
end
