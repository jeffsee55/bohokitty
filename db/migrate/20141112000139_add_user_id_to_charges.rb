class AddUserIdToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :user_id, :integer
    remove_column :charges, :customer_id
  end
end
