require "csv"
require "open-uri"
require "nokogiri"


class Bgg
  def initialize
    @filepath = "app/services/archive/bgg_small_development.csv"
    @person_filepath = "app/services/archive/bgg_Person.csv"
  end

  def call
    people = read_people_csv
    puts "Loaded Person csv..."

    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      designer_arr = row[:designer].nil? ? [""] : row[:designer].split(",")
      artist_arr = row[:artist].nil? ? [""] : row[:artist].split(",")

      boardgame = Boardgame.create(bgg_id: row[:bgg_id], name: row[:name],
                      min_players: row[:min_players].to_i, max_players: row[:max_players].to_i,
                      rating: row[:avg_rating].to_f, complexity: row[:complexity].to_f, min_time: row[:min_time].to_i,
                      max_time: row[:max_time].to_i,
                      designers: designer_arr, artists: artist_arr
                      )
      get_picture_and_description(boardgame)
    end
    p "Finished getting info from BGG"

    puts "Getting name of designers / artists..."
    update_designers_and_artists(people)
    puts "All done!"
  end

  def update_designers_and_artists(people)
    Boardgame.all.each do |boardgame|
      designers = []
      boardgame.designers.each do |designer|
        person = people.find { |elm| elm[:id] == designer.to_i }
        if person
          designers << person[:name]
        end
      end
      boardgame.update(designers: designers)

      artists = []
      boardgame.artists.each do |artist|
        person = people.find { |elm| elm[:id] == artist.to_i }
        if person
          artists << person[:name]
        end
      end
      boardgame.update(artists: artists)
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

  def read_people_csv
    people = []
    CSV.foreach(@person_filepath, headers: :first_row, header_converters: :symbol) do |row|
      people << { id: row[:bgg_id].to_i, name: row[:name] }
    end
    people
  end
end
