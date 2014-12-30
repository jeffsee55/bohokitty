class ChangeAmountTypeToFloat < ActiveRecord::Migration
  def change
    change_column :charges, :amount, :float
  end
end
