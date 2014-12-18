class Charge < ActiveRecord::Base

  def human_total
    amount / 100
  end

  def add_details
    # Get these from the cart session
  end

end
