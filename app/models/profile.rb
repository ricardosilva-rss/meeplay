class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :date_of_birth, presence: true
end
