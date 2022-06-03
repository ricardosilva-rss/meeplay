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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def create_user_meeting
    UserMeeting.create!(user: self.user, meeting: self)
  end
end
