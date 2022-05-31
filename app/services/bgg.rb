require "csv"
require "open-uri"
require "nokogiri"
# require_relative "../models/boardgame"

class Bgg
  def initialize
    @filepath = "app/services/archive/bgg_smaller_alternative.csv"
  end

  def call
    CSV.foreach(@filepath, headers: :first_row) do |row|
      Boardgame.new(bgg_id: row['bgg_id'].to_i, name: row['name'],
                    max_players: row['max_players'].to_i, rating: row['avg_rating'].to_f,
                    complexity: row['complexity'].to_f, avg_duration: (row['max_time'].to_i - row['min_time'].to_i)
                  )
    end
  end

  def get_picture(boardgame)
    url = "https://boardgamegeek.com/boardgame/#{boardgame.bgg_id}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search(".ng-scope").each do |element|
      puts element
    end
  end
end
