class AddStripeTokenToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :customer_token, :string
  end
end
