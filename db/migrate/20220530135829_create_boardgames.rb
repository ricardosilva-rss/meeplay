class CreateBoardgames < ActiveRecord::Migration[6.1]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.integer :avg_duration
      t.integer :max_players
      t.float :complexity
      t.float :rating

      t.timestamps
    end
  end
end
