class CreateCustomers < ActiveRecord::Migration
  def change
    drop_table :customers
    
    create_table :customers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
