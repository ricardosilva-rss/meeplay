class AddProfileEditedToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :edited_profile, :boolean, default: false
  end
end
