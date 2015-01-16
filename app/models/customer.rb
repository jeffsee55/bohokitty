class Customer < ActiveRecord::Base
  def add_stripe_token(card)
    unless token?
      token = Stripe::Customer.create(
        email: self.email,
        card: card
      )
      self.update_attributes(token: token.id)
    end
    self
  end
end
