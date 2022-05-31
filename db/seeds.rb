require "open-uri"

Boardgame.destroy_all
User.destroy_all
Meeting.destroy_all
UserMeeting.destroy_all

database = Bgg.new
database.call

guy = User.create(email: "guygb91@gmail.com", password: "131415161718")
jose = User.create(email: "ja.melo321@gmail.com", password: "192021222324")
raimundo = User.create(email: "raimundo.henriques@gmail.com", password: "123456")
ricardo = User.create(email: "ricardosilva.rss@gmail.com", password: "789101112")

chatroom = Chatroom.create!

10.times do
  user = [guy, jose, raimundo, ricardo].sample
  boardgame = Boardgame.find(rand(1..25))
  Meeting.create!(user: user, boardgame: boardgame, start_date: 20220610, address:"Rua do Conde Redondo",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  name: "#{boardgame.name} night", chatroom: chatroom, players_wanted: 3)
end

30.times do
  user = [guy, jose, raimundo, ricardo].sample
  meeting = Meeting.find(rand(1..10))
  UserMeeting.create!(user: user, meeting: meeting)
end
