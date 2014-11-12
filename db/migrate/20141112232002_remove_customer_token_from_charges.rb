class RemoveCustomerTokenFromCharges < ActiveRecord::Migration
  def change
    remove_column :charges, :customer_token
  end
end
