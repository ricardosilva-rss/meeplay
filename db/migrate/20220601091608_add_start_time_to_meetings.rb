class AddStartTimeToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :start_time, :time
  end
end
