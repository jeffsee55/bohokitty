class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :customer_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
