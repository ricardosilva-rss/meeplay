class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
  belongs_to :chatroom
  has_many :user_meetings, dependent: :destroy
  has_many :users, through: :user_meetings

  validates :user_id, presence: true
  validates :boardgame_id, presence: true
  validates :start_date, presence: true
  validates :players_wanted, presence: true
  validates :address, presence: true
  validates :user_is_owner, presence: true
  validates :name, presence: true
end
