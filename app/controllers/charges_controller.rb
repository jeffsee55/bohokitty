class ChargesController < ApplicationController
  before_action :set_charge, only: [:show]

  def new
    @charge = Charge.new
    @cart = Cart.find(params[:cart_id])
    @customer = Customer.find(params[:customer_id])
  end

  def create
    card = params[:stripe_token]
    cart = Cart.find(charge_params[:cart_id])
    customer = cart.customer
    customer.add_stripe_token(card)
    Stripe::Charge.create(
      amount: cart.total,
      currency: "usd",
      customer: customer.token,
      description: "Charge for #{customer.email}"
    )
    @charge = Charge.create(
      token: card,
      customer_id: customer.id,
      cart_id: cart.id
    )
    cart.remove_products
    redirect_to @charge
  end

  def show
    @customer = @charge.customer
    @card_info = Stripe::Token.retrieve(@charge.token).card
  end

  private
    def set_charge
      @charge = Charge.find(params[:id])
    end

    def charge_params
      params.require(:charge).permit(:cart_id)
    end
end
