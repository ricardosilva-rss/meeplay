class AddDescriptionToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :description, :text
  end
end
