class AddAdditionalToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :additional, :text
  end
end
