class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :boardgame, null: false, foreign_key: true
      t.date :start_date
      t.integer :players_wanted
      t.boolean :user_is_owner
      t.string :address
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
