class RemoveRibbonColorFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ribbon_color
  end
end
