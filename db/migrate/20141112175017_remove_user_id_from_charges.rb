class RemoveUserIdFromCharges < ActiveRecord::Migration
  def change
    remove_column :charges, :user_id
  end
end
