class AddMinPlayersToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :min_players, :integer
  end
end
