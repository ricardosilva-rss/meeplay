require "open-uri"

UserMeeting.destroy_all
Meeting.destroy_all
Chatroom.destroy_all
User.destroy_all
Boardgame.destroy_all

database = Bgg.new
database.call

guy = User.create(email: "guygb91@gmail.com", password: "131415161718")
jose = User.create(email: "ja.melo321@gmail.com", password: "192021222324")
raimundo = User.create(email: "raimundo.henriques@gmail.com", password: "123456")
ricardo = User.create(email: "ricardosilva.rss@gmail.com", password: "789101112")

10.times do
  user = [guy, jose, raimundo, ricardo].sample
  boardgame = Boardgame.all.sample
  chatroom = Chatroom.create!
  meeting = Meeting.create!(user: user, boardgame: boardgame, start_date: 20220610, start_time: Time.new(2022, 6, 10, 16, 00, 0), address:"Lisboa, Rua do Conde Redondo",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  name: "#{boardgame.name} night", chatroom: chatroom, players_wanted: 3)
end

30.times do
  user = [guy, jose, raimundo, ricardo].sample
  meeting = Meeting.all.sample
  UserMeeting.create!(user: user, meeting: meeting)
end
