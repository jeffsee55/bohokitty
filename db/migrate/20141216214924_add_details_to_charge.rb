class AddDetailsToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :details, :text
  end
end
