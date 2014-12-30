class ChangeTypeForEventDate < ActiveRecord::Migration
  def change
    change_column :charges, :event_date, :string
  end
end
