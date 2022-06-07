class RemoveAvgDurationFromBoardgames < ActiveRecord::Migration[6.1]
  def change
    remove_column :boardgames, :avg_duration, :integer
  end
end
