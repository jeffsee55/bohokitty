class CartProductsController < ApplicationController
  def create
    email = params[:email]
    customer = Customer.find_or_create_by(email: email)
    cart = Cart.find_or_create_by(customer_id: customer.id)
    @cart_product = CartProduct.new(
      cart_id: cart.id,
      product_id: cart_product_params[:product_id]
    )
    if @cart_product.save
      redirect_to cart
    else
    end
    session[:customer_id] = customer.id
  end

  def destroy
  end

  private
    def cart_product_params
      params.require(:cart_product).permit(:cart_id, :product_id)
    end
end
