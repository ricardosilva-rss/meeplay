class User < ApplicationRecord
  has_one :profile
  has_many :meetings
  has_many :meetings, through: :user_meetings
  has_many :user_meetings
  has_many :user_boardgames
  has_many :boardgames, through: :user_boardgames

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
