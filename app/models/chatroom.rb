class Chatroom < ApplicationRecord
  has_one :meeting
  has_many :messages, dependent: :destroy
end
