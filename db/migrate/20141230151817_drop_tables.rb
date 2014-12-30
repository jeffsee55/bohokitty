class DropTables < ActiveRecord::Migration
  def change
    drop_table :customers
    drop_table :ckeditor_assets
  end
end
