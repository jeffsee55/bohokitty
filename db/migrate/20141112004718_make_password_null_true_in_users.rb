class MakePasswordNullTrueInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :encrypted_password
    add_column :users, :encripted_password, :string
  end
end
