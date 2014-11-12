class ChangeCustomerTokenColumn < ActiveRecord::Migration
  def change
    remove_column :customers, :customer_token
  end
end
