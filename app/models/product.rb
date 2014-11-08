class Product < ActiveRecord::Base
  has_many :cart_products
  has_many :carts, through: :cart_products

  validates :name, presence: true
  validates :price, presence: true
  validates :description, length: { maximum: 120 }

  def human_price
    self.price / 100
  end

end
