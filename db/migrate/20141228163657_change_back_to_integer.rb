class ChangeBackToInteger < ActiveRecord::Migration
  def change
    change_column :charges, :amount, :integer
  end
end
