class UserMeeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting, counter_cache: :players_total

  validates :user, uniqueness: { scope: :meeting, message: "You can't be in the same meeting twice" }

  validates_with UserMeetingsValidator, on: :create
  validates_with PlayersWantedValidator, on: :create
end
