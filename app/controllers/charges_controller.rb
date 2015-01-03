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
    email = charge_params[:email]
    stripe_token = params[:stripe_token]
    amount = charge_params[:amount]
    begin
      token = Stripe::Charge.create(
      amount: charge_params[:amount],
      currency: "usd",
      card: params[:stripe_token],
      description: "Purchase from #{charge_params[:email]}",
      metadata: {
        products: cart_session.products_to_string,
        total_products: cart_session.products.count,
        special_instructions: charge_params[:additional],
        statement_description: "Purchase from BohoKitty.com"
      }
      )
    rescue Stripe::CardError => e
      redirect_to cart_path, notice: "We're sorry. #{e.message}"
      return
    end
    if token
      token = token.id
      @charge = Charge.create(
        token: token,
        email: charge_params[:email],
        amount: charge_params[:amount],
        details: cart_session.products_to_string,
        additional: charge_params[:additional],
        event_date: charge_params[:event_date],
        session_id: charge_params[:session_id]
      )
      SiteMailer.purchase_confirmation(@charge).deliver
      cart_session.empty_cart
    else
    end
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
