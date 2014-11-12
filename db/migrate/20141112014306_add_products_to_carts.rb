class AddProductsToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :product_id, :integer
    remove_column :carts, :user_id
  end
end
