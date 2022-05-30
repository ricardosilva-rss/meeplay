class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :bgg_profile
      t.text :description
      t.date :date_of_birth

      t.timestamps
    end
  end
end
