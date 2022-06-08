class AddPlayersTotalToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :players_total, :integer, default: 0, null: false
  end
end
