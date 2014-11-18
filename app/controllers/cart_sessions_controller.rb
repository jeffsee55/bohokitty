class CartSessionsController < ApplicationController
  def show
    cart_session.products.each do |p|
      if p[1] <= 0
        cart_session.products.delete(p)
      end
    end
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
end
