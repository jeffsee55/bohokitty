class Cart < ActiveRecord::Base
  belongs_to :customer

  has_one :charge
  has_many :cart_products
  has_many :products, through: :cart_products

  def total
    self.products.to_a.sum(&:price)
  end

  def human_total
    total / 100
  end

  def remove_products
    cart_products.delete_all
  end

  def products_count
    products.reduce(Hash.new(0)) do |h, v|
      h.store(v, h[v] + 1)
      h
    end
  end
end
