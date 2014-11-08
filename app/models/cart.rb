class Cart < ActiveRecord::Base
  belongs_to :customer

  has_one :charge
  has_many :cart_products
  has_many :products, through: :cart_products
end
