class Boardgame < ApplicationRecord
  has_many :meetings
  has_many :user_boardgames
  has_many :users, through: :user_boardgames

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_max_players,
  against: [ :name, :max_players ],
  using: {
    tsearch: { prefix: true }
  }
end
