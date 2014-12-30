class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  def human_price
    self.price / 100
  end

  def image_url(position, size)
    images[position].image.url(size.to_sym)
  end

  def options_to_array
    options.split(',')
  end

end
