class Charge < ActiveRecord::Base

  def human_total
    amount / 100
  end

end
