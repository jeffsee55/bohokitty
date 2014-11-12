class AddCustomerTokenToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :customer_token, :string
  end
end
