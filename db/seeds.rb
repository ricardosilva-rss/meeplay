require "open-uri"

database = Bgg.new
database.call.each do |boardgame|
  database.
end

file = URI.open('')
article = Article.new(title: 'NES', body: "A great console")
article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
