class AddMinTimeToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :min_time, :integer
  end
end
