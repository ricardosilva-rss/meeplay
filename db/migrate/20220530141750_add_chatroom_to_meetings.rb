class AddChatroomToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_reference :meetings, :chatroom, null: false, foreign_key: true
  end
end
