class AddBggIdToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :bgg_id, :integer
  end
end
