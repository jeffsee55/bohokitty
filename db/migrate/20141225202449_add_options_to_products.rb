class AddOptionsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :options, :string
  end
end
