class AddStripeTokenToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :token, :string
  end
end
