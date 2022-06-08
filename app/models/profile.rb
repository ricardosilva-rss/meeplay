class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :date_of_birth, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  after_validation :geocode, on: :create
end
