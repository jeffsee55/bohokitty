class DropPageModel < ActiveRecord::Migration
  def change
    drop_table :pages
  end
end
