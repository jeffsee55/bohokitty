class AddCustomerConfirmable < ActiveRecord::Migration

  def self.up
    Customer.update_all(confirmed_at: Time.now, confirmation_sent_at: Time.now)
  end
end
