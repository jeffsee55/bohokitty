class AddUserIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :user_id, :integer
    remove_column :carts, :customer_id
  end
end
