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
  validate :meeting_cannot_have_more_players_than_game_allows, on: :create

  after_create :create_user_meeting

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address_and_host,
  against: [ :address, :name, :start_date ],
  associated_against: {
    boardgame: [ :name ],
    user: [ :email ]
  },
  using: {
    tsearch: { prefix: true }
  }

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  def meeting_cannot_have_more_players_than_game_allows
    if  self.players_wanted > self.boardgame.max_players
      errors.add(:players_wanted, "can't have more players than the game allows")
    end
  end

  def full?
    self.players_wanted == self.users.count
  end

  private

  def create_user_meeting
    UserMeeting.create!(user: self.user, meeting: self)
  end
end
