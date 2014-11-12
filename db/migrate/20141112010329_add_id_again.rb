class AddIdAgain < ActiveRecord::Migration
  def change
    add_column :carts, :customer_id, :integer
    add_column :charges, :customer_id, :integer
  end
end
