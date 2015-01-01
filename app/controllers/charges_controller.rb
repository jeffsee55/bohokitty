class ChargesController < ApplicationController
  before_action :set_charge, only: [:show]
  layout 'layouts/basic', only: :show

  def new
    @charge = Charge.new
    if cart_session.total == 0
      redirect_to products_path, notice: "You're cart is empty, add some items to proceed to checkout."
    end
  end

  def create
    card = params[:stripe_token]
    amount = params[:amount]
    email = charge_params[:email]
    token = Stripe::Charge.create(
      amount: amount,
      currency: "usd",
      card: card,
      description: "Purchase from #{email}",
      metadata: {
        products: cart_session.products_to_string,
        total_products: cart_session.products.count,
        special_instructions: params[:options],
        statement_description: "Purchase from BohoKitty.com"
      }
    )
    @charge = Charge.create(
      token: token.id,
      email: email,
      amount: amount,
      details: cart_session.products_to_string,
      additional: charge_params[:additional],
      event_date: charge_params[:event_date],
      session_id: session[:session_id]
    )
    SiteMailer.purchase_confirmation(@charge).deliver
    cart_session.empty_cart
    redirect_to @charge
  end

  def show
    if session[:session_id] == @charge.session_id
      @charge
      @stripe_charge = Stripe::Charge.retrieve(@charge.token)
    else
      redirect_to root_path, notice: "You may no longer view this purchase summary."
    end
  end

  private
    def set_charge
      @charge = Charge.find(params[:id])
    end

    def charge_params
      params.require(:charge).permit(:amount, :email, :additional, :event_date, :session_id)
    end
end
