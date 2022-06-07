require "csv"
require "open-uri"
require "nokogiri"
# require_relative "../models/boardgame"

class Bgg
  def initialize
    @filepath = "app/services/archive/bgg_small_development.csv"
    @person_filepth = "app/services/archive/bgg_Person.csv"
  end

  def call
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      boardgame = Boardgame.create(bgg_id: row[:bgg_id], name: row[:name],
                      min_players: row[:min_players].to_i, max_players: row[:max_players].to_i,
                      rating: row[:avg_rating].to_f, complexity: row[:complexity].to_f, min_time: row[:min_time].to_i,
                      max_time: row[:max_time].to_i,
                      designers: row[:designer], artists: row[:artist]
                      )
    get_picture_and_description(boardgame)
    update_designers_and_artists(boardgame)
    end
    p "finished getting info from BGG"
  end

  def update_designers_and_artists(boardgame)
    CSV.foreach(@person_filepath, headers: :first_row, header_converters: :symbol) do |row|
      if row[:bgg_id] == boardgame.designers
        boardgame.update(designers: row[:name])
      end
      if row[:bgg_id].to_i == boardgame.artists
        boardgame.update(artists: row[:name])
      end
    end
  end

  def get_picture_and_description(boardgame)
    xml_url = "https://api.geekdo.com/xmlapi2/thing?id=#{boardgame.bgg_id}"
    html_file = URI.open(xml_url).read
    document = Nokogiri::XML(html_file)
    # url = "https://boardgamegeek.com/boardgame/#{boardgame.bgg_id}"
    # html_file = URI.open(url).read
    # html_doc = Nokogiri::HTML(html_file)
    # max_players = document.search("maxplayers").attribute("value").text
    selected_boardgame = Boardgame.find(boardgame.id)
    bgg_image = URI.open(document.search("image").text)
    selected_boardgame.photo.attach(io: bgg_image, filename: "#{boardgame.name}.png", content_type: 'image/png')
    selected_boardgame = Boardgame.find(boardgame.id)
    bgg_description = document.search("description").text
    selected_boardgame.update(description: bgg_description)
  end
end
