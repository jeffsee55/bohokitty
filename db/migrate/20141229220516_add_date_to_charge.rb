class AddDateToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :event_date, :date
  end
end
