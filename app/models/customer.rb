class Customer < ActiveRecord::Base
  has_one :cart
  has_many :charges

  def self.check_if_exists_and_return_cart(email)
    customer = find_or_create_by(email: email)
    unless customer.cart
      Cart.create(customer_id: customer.id)
    end
  end
end
