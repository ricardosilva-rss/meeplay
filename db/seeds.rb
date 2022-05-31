require "open-uri"

Boardgame.destroy_all

database = Bgg.new
database.call

p Boardgame.last
