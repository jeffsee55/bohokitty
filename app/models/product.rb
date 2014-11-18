class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :description, length: { maximum: 120 }

  def human_price
    self.price / 100
  end

end
