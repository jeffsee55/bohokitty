class AddChargeFields < ActiveRecord::Migration
  def change
    add_column :charges, :amount, :integer
  end
end
