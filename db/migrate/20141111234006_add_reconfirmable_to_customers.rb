class AddReconfirmableToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :unconfirmed_email, :string
  end
end
