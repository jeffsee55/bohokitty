class AddSessionIdToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :session_id, :string
  end
end
