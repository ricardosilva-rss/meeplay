class AddDesignersToBoardgames < ActiveRecord::Migration[6.1]
  def change
    add_column :boardgames, :designers, :text, array: true, default: []
  end
end
