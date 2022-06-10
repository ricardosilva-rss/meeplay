class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
  belongs_to :chatroom
  has_many :user_meetings, dependent: :destroy
  has_many :users, through: :user_meetings

  validates :user_id, :address, :name, :boardgame_id, :start_date, :start_time,
            :players_wanted, :user_is_owner, presence: true

  validate :start_date_cannot_be_in_the_past, on: :create
  validate :meeting_cannot_have_more_players_than_game_allows, on: :create
  validate :cannot_create_meeting_if_busy_at_that_time, on: :create

  after_create :create_user_meeting

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address_and_host,
                  against: %i[address name start_date],
                  associated_against: {
                    boardgame: [:name],
                    user: [:email]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  scope :not_full, -> { where('players_total < players_wanted') }

  def meeting_cannot_have_more_players_than_game_allows
    return unless players_wanted > boardgame.max_players

    errors.add(:players_wanted, "can't have more players than the game allows")
  end

  def full?
    players_wanted == users.count
  end

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date < Date.today
  end

  def cannot_create_meeting_if_busy_at_that_time
    user_meetings = user.meetings.where(start_date: start_date, start_time: start_time)
    if user_meetings.any?
      record.errors.add(
        :meeting,
        "You already have a meeting at that time"
      )
    end
  end

  private

  def create_user_meeting
    UserMeeting.create!(user: user, meeting: self)
  end
end
