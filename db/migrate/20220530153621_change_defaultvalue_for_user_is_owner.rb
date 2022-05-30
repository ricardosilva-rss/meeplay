class ChangeDefaultvalueForUserIsOwner < ActiveRecord::Migration[6.1]
  def change
    change_column_default :meetings, :user_is_owner, true
  end
end
