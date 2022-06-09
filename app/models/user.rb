require "open-uri"

class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :owned_meetings, foreign_key: "user_id", class_name: "Meeting"
  has_many :user_meetings
  has_many :meetings, through: :user_meetings
  has_many :user_boardgames
  has_many :boardgames, through: :user_boardgames

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_profile_for_user

  def create_profile_for_user
    profile = Profile.create(user: self, name: "Me", date_of_birth: Date.new(2000, 1, 1))
    file4 = URI.open('https://avatars.githubusercontent.com/u/97455167?v=4')
    profile.photo.attach(io: file4, filename: 'ricardo.jpg', content_type: 'image/jpg')
  end
end
