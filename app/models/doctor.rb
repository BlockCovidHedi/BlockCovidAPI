class Doctor < ApplicationRecord
  belongs_to :user
  validates :inami, :uniqueness => true
  validates :user_id, presence: true

end
