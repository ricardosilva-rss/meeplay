class Boardgame < ApplicationRecord
  has_many :meetings
  has_many :user_boardgames
  has_many :users, through: :user_boardgames

  has_one_attached :photo
end
