class AddArtistsToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :artists, :text, array: true, default: []
  end
end
