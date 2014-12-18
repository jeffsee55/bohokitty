class Product < ActiveRecord::Base
  has_many :images

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :images

  def human_price
    self.price / 100
  end

  def image_url(position, size)
    images[position].image.url(size.to_sym)
  end

end
