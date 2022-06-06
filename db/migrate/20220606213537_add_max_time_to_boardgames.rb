class AddMaxTimeToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :max_time, :integer
  end
end
