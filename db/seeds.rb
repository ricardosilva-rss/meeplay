require "open-uri"

UserMeeting.destroy_all
Meeting.destroy_all
Chatroom.destroy_all
UserBoardgame.destroy_all
User.destroy_all
Boardgame.destroy_all

database = Bgg.new
database.call

guy = User.create(email: "guygb91@gmail.com", password: "131415161718")
jose = User.create(email: "ja.melo321@gmail.com", password: "192021222324")
raimundo = User.create(email: "raimundo.henriques@gmail.com", password: "123456")
ricardo = User.create(email: "ricardosilva.rss@gmail.com", password: "789101112")

guy.profile.update!(
                name: "Guy Gan Baruch",
                description: "I'm an IT admin want to make a change in the world on the environmental sector. and I like cats and remote controlled helicopters.",
                date_of_birth: Date.new(1996, 1, 1),
                city: "Lisbon, Portugal",
                edited_profile: true
              )
file1 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1652775726/ctcrjpqfgbxallgn9xqr.jpg')
guy.profile.photo.attach(io: file1, filename: 'guy.jpg', content_type: 'image/jpg')

jose.profile.update!(
                name: "José de Melo",
                description: "i did social studies at universidade catolica",
                date_of_birth: Date.new(1998, 1, 1),
                city: "Lisbon, Portugal",
                edited_profile: true
)
file2 = URI.open('https://avatars.githubusercontent.com/u/99876826?v=4')
jose.profile.photo.attach(io: file2, filename: 'jose.jpg', content_type: 'image/png')

raimundo.profile.update!(
                name: "Raimundo Henriques",
                description: "I've been studying philosophy and literary theory for the past years and want to look for other opportunities and to develop my passion for technology.",
                date_of_birth: Date.new(1991, 1, 17),
                city: "Lisbon, Portugal",
                edited_profile: true
)
file3 = URI.open('https://avatars.githubusercontent.com/u/100690574?v=4')
raimundo.profile.photo.attach(io: file3, filename: 'raimundo.jpg', content_type: 'image/jpg')

ricardo.profile.update!(
                name: "Ricardo Silva",
                description: "After years of doing administrative work and some acting, I am now looking for a change. Always liked computers and videogames, so coding just felt right...",
                date_of_birth: Date.new(1991, 1, 1),
                city: "Lisbon, Portugal",
                edited_profile: true
)
file4 = URI.open('https://avatars.githubusercontent.com/u/97455167?v=4')
ricardo.profile.photo.attach(io: file4, filename: 'ricardo.jpg', content_type: 'image/jpg')

boardgame = Boardgame.all.sample
meeting_guy_1 = Meeting.create!(user: guy,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 10),
  start_time: Time.new(2022, 6, 10, 16, 00, 0),
  description: "No smoking, please.",
  name: "let's play #{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Rua do Conde Redondo"
)

boardgame = Boardgame.all.sample
meeting_guy_2 = Meeting.create!(user: guy,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 11),
  start_time: Time.new(2022, 6, 11, 18, 00, 0),
  description: "I have cats, hope you're not allergic!",
  name: "#{boardgame.name} night",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Porto, Avenida dos Aliados"
)

boardgame = Boardgame.all.sample
meeting_guy_3 = Meeting.create!(user: guy,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 16),
  start_time: Time.new(2022, 6, 16, 16, 00, 0),
  description: "No cellphones allowed!",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Évora, Praça do Giraldo"
)

boardgame = Boardgame.all.sample
meeting_guy_4 = Meeting.create!(user: guy,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 19),
  start_time: Time.new(2022, 6, 19, 16, 00, 0),
  description: "Bring snacks, but please be careful with the game.",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Portimão, Infante D. Henrique"
)

boardgame = Boardgame.all.sample
meeting_jose_1 = Meeting.create!(user: jose,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 10),
  start_time: Time.new(2022, 6, 10, 16, 00, 0),
  description: "I have beer!",
  name: "Afternoon of #{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Rua do Conde Redondo"
)

boardgame = Boardgame.all.sample
meeting_jose_2 = Meeting.create!(user: jose,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 12),
  start_time: Time.new(2022, 6, 12, 20, 00, 0),
  description: "Make sure my dog doesn't note you're afraid of it. Everything will be alright!",
  name: "Evening of #{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Porto, Rua Passos Manuel"
)

boardgame = Boardgame.all.sample
meeting_jose_3 = Meeting.create!(user: jose,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 20),
  start_time: Time.new(2022, 6, 20, 14, 00, 0),
  description: "Bring snacks, please!",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Coimbra, Universidade de Coimbra"
)

boardgame = Boardgame.all.sample
meeting_jose_4 = Meeting.create!(user: jose,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 21),
  start_time: Time.new(2022, 6, 21, 14, 00, 0),
  description: "Bring positive vibes and beers, please.",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Alameda da Universidade"
)

boardgame = Boardgame.all.sample
meeting_raimundo_1 = Meeting.create!(user: raimundo,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 13),
  start_time: Time.new(2022, 6, 13, 16, 00, 0),
  description: "The cat doesn't bite. Unless you try to grab it.",
  name: "Join me at #{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Rua do Conde Redondo"
)

boardgame = Boardgame.all.sample
meeting_raimundo_2 = Meeting.create!(user: raimundo,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 14),
  start_time: Time.new(2022, 6, 14, 16, 00, 0),
  description: "No smoking, please.",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Avenida 5 de Outubro"
)

boardgame = Boardgame.all.sample
meeting_raimundo_3 = Meeting.create!(user: raimundo,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 21),
  start_time: Time.new(2022, 6, 21, 14, 00, 0),
  description: "No smoking, please!",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Rua do Conde Redondo"
)

boardgame = Boardgame.all.sample
meeting_raimundo_4 = Meeting.create!(user: raimundo,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 23),
  start_time: Time.new(2022, 6, 23, 18, 00, 0),
  description: "I have beers!",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Porto, Rua das Flores"
)

boardgame = Boardgame.all.sample
meeting_ricardo_1 = Meeting.create!(user: ricardo,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 14),
  start_time: Time.new(2022, 6, 14, 20, 00, 0),
  description: "No cellphones, please!",
  name: "#{boardgame.name} night",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Porto, Avenida da Boavista"
)

boardgame = Boardgame.all.sample
meeting_ricardo_2 = Meeting.create!(user: ricardo,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 21),
  start_time: Time.new(2022, 6, 21, 14, 00, 0),
  description: "No smoking allowed in the house.",
  name: "#{boardgame.name} evening",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Berlin, Kudamm"
)

boardgame = Boardgame.all.sample
meeting_ricardo_3 = Meeting.create!(user: ricardo,
  boardgame: boardgame,
  start_date: Date.new(2022, 6, 25),
  start_time: Time.new(2022, 6, 25, 18, 00, 0),
  description: "Bring good vibes and beers!",
  name: "#{boardgame.name} evening",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Rua do Conde Redondo"
)

boardgame = Boardgame.all.sample
meeting_ricardo_4 = Meeting.create!(user: ricardo,
  boardgame: boardgame,
  start_date: Date.new(2022, 7, 1),
  start_time: Time.new(2022, 7, 1, 16, 00, 0),
  description: "No snacks allowed at the table.",
  name: "#{boardgame.name}",
  chatroom: Chatroom.create!,
  players_wanted: rand(boardgame.min_players..boardgame.max_players),
  address: "Lisboa, Rossio"
)

User.all.find_each do |user|
  4.times do
    user_times = user.meetings.pluck(:start_time)

    available_meetings = Meeting.not_full.where.not(start_time: user_times)

    next if available_meetings.empty?

    UserMeeting.create!(user: user, meeting: available_meetings.sample)
  end
end
