class CartSessionsController < ApplicationController
  layout :resolve_layout

  def show
    cart_session.products.each do |p|
      if p[1] <= 0
        cart_session.products.delete(p)
      end
    end
    @charge = Charge.new
    @products = cart_session.products
    if cart_session.total == 0
      redirect_to products_path, notice: "You're cart is empty, add some items to proceed to checkout."
    end
  end

  def create
    cart_session.add_product(params[:product_id], params[:qty])
    redirect_to :back
  end

  def add_item
    cart_session.add_product(params[:product_id], params[:qty])
    redirect_to :back
  end

  def remove_item
    cart_session.remove_product(params[:product_id], params[:qty])
    redirect_to :back
  end

  def destroy
    cart_session.empty_cart
    redirect_to :back
  end

  private
    def resolve_layout
      case action_name
      when "show"
        "layouts/table"
      else
        "layouts/application"
      end
    end
end
