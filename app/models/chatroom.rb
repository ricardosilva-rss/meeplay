class Chatroom < ApplicationRecord
  has_one :meeting
  has_many :messages, dependent: :destroy

  scope :of_current_user, ->(user) { includes(meeting: :user_meetings).where(user_meetings: {user_id: user.id})}
end
