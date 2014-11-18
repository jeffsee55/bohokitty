class AddEmailToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :email, :string
    remove_column :charges, :customer_id
    remove_column :charges, :cart_id
  end
end
