require "csv"
require "open-uri"
require "nokogiri"
# require_relative "../models/boardgame"

class Bgg
  def initialize
    @filepath = "app/services/archive/bgg_small_development.csv"
  end

  def call
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      boardgame = Boardgame.create(bgg_id: row[:bgg_id], name: row[:name],
                      min_players: row[:min_players].to_i, max_players: row[:max_players].to_i,
                      rating: row[:avg_rating].to_f, complexity: row[:complexity].to_f, min_time: row[:min_time].to_i,
                      max_time: row[:max_time].to_i
                      )
    get_picture(boardgame)
    end
    p "finished getting info from BBG"
  end

  def get_picture(boardgame)
    xml_url = "https://api.geekdo.com/xmlapi2/thing?id=#{boardgame.bgg_id}"
    html_file = URI.open(xml_url).read
    document = Nokogiri::XML(html_file)
    # url = "https://boardgamegeek.com/boardgame/#{boardgame.bgg_id}"
    # html_file = URI.open(url).read
    # html_doc = Nokogiri::HTML(html_file)
    # max_players = document.search("maxplayers").attribute("value").text
    selected_boardgame = Boardgame.find(boardgame.id)
    bgg_description = URI.open(document.search("description").text)
    selected_boardgame.update(description: bgg_description)
    bgg_image = URI.open(document.search("image").text)
    selected_boardgame.photo.attach(io: bgg_image, filename: "#{boardgame.name}.png", content_type: 'image/png')

  end
end
