class AddRibbonColorToProduct < ActiveRecord::Migration
  def change
    add_column :products, :ribbon_color, :string
  end
end
