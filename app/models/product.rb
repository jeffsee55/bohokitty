class Product < ActiveRecord::Base

  def human_price
    self.price / 100
  end

end
