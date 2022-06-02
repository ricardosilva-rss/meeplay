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

boardgame = Boardgame.all.sample
chatroom = Chatroom.create!

meeting_guy_1 = Meeting.create!(user: guy, boardgame: boardgame, start_date:20220610,
  start_time: Time.new(2022, 6, 10, 16, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "let's play #{boardgame.name}", chatroom: chatroom, players_wanted: 3,
  address: "Lisboa, Rua do Conde Redondo"
)

meeting_guy_2 = Meeting.create!(user: guy, boardgame: boardgame, start_date: 20220611,
  start_time: Time.new(2022, 6, 11, 18, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name} night", chatroom: chatroom, players_wanted: 2,
  address: "Porto, Avenida dos Aliados"
)

meeting_guy_3 = Meeting.create!(user: guy, boardgame: boardgame, start_date: 20220616,
  start_time: Time.new(2022, 6, 16, 16, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 3,
  address: "Évora, Praça do Giraldo"
)

meeting_guy_4 = Meeting.create!(user: guy, boardgame: boardgame, start_date: 20220619,
  start_time: Time.new(2022, 6, 19, 16, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 3,
  address: "Portimão, Infante D. Henrique"
)

meeting_jose_1 = Meeting.create!(user: jose, boardgame: boardgame, start_date: 20220610,
  start_time: Time.new(2022, 6, 10, 16, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "Afternoon of #{boardgame.name}", chatroom: chatroom, players_wanted: 3,
  address: "Lisboa, Rua do Conde Redondo"
)

meeting_jose_2 = Meeting.create!(user: jose, boardgame: boardgame, start_date: 20220612,
  start_time: Time.new(2022, 6, 12, 20, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "Evening of #{boardgame.name}", chatroom: chatroom, players_wanted: 3,
  address: "Porto, Rua Passos Manuel"
)

meeting_jose_3 = Meeting.create!(user: jose, boardgame: boardgame, start_date: 20220620,
  start_time: Time.new(2022, 6, 20, 14, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 2,
  address: "Coimbra, Universidade de Coimbra"
)

meeting_jose_4 = Meeting.create!(user: jose, boardgame: boardgame, start_date: 20220621,
  start_time: Time.new(2022, 6, 21, 14, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 2,
  address: "Lisboa, Alameda da Universidade"
)

meeting_raimundo_1 = Meeting.create!(user: raimundo, boardgame: boardgame, start_date: 20220613,
  start_time: Time.new(2022, 6, 13, 16, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "Join me at #{boardgame.name}", chatroom: chatroom, players_wanted: 2,
  address: "Lisboa, Rua do Conde Redondo"
)

meeting_raimundo_2 = Meeting.create!(user: raimundo, boardgame: boardgame, start_date: 20220614,
  start_time: Time.new(2022, 6, 14, 16, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 1,
  address: "Lisboa, Avenida 5 de Outubro"
)

meeting_raimundo_3 = Meeting.create!(user: raimundo, boardgame: boardgame, start_date: 20220621,
  start_time: Time.new(2022, 6, 21, 14, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 2,
  address: "Lisboa, Rua do Conde Redondo"
)

meeting_raimundo_4 = Meeting.create!(user: raimundo, boardgame: boardgame, start_date: 20220623,
  start_time: Time.new(2022, 6, 23, 18, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 3,
  address: "Porto, Rua das Flores"
)

meeting_ricardo_1 = Meeting.create!(user: ricardo, boardgame: boardgame, start_date: 20220614,
  start_time: Time.new(2022, 6, 14, 20, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name} night", chatroom: chatroom, players_wanted: 2,
  address: "Porto, Avenida da Boavista"
)

meeting_ricardo_2 = Meeting.create!(user: ricardo, boardgame: boardgame, start_date: 20220621,
  start_time: Time.new(2022, 6, 21, 14, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name} evening", chatroom: chatroom, players_wanted: 2,
  address: "Berlin, Kudamm"
)

meeting_ricardo_3 = Meeting.create!(user: ricardo, boardgame: boardgame, start_date: 20220625,
  start_time: Time.new(2022, 6, 25, 18, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name} evening", chatroom: chatroom, players_wanted: 3,
  address: "Lisboa, Rua do Conde Redondo"
)

meeting_ricardo_4 = Meeting.create!(user: ricardo, boardgame: boardgame, start_date: 20220701,
  start_time: Time.new(2022, 7, 1, 16, 00, 0),
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  name: "#{boardgame.name}", chatroom: chatroom, players_wanted: 2,
  address: "Lisboa, Rossio"
)


UserMeeting.create!(user: guy, meeting: meeting_jose_2)
UserMeeting.create!(user: guy, meeting: meeting_raimundo_3)
UserMeeting.create!(user: guy, meeting: meeting_ricardo_3)
UserMeeting.create!(user: guy, meeting: meeting_ricardo_4)

UserMeeting.create!(user: jose, meeting: meeting_guy_3)
UserMeeting.create!(user: jose, meeting: meeting_guy_2)
UserMeeting.create!(user: jose, meeting: meeting_raimundo_3)
UserMeeting.create!(user: jose, meeting: meeting_ricardo_4)

UserMeeting.create!(user: raimundo, meeting: meeting_ricardo_4)
