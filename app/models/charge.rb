class Charge < ActiveRecord::Base
  validates :token, presence: true
  validates :email, presence: true
  validates :amount, presence: true

  def human_total
    amount / 100
  end

  def add_details
    # Get these from the cart session
  end

end
