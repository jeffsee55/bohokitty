class CartProductsController < ApplicationController
  def create
    # If the email belongs to a customer, use their cart
    # If no email exist, create a new customer and cart
    customer_cart = Customer.check_if_exists_and_return_cart(params[:email])

    @cart_product = CartProduct.new(
      cart_id: customer_cart.id,
      product_id: params[:product_id]
    )
    if @cart_product.save
      redirect_to cart_path(@cart_product.cart_id)
    else
    end
  end

  def destroy
  end

  private
    def cart_product_params
      params.require(:cart_product).permit(:cart_id, :product_id)
    end
end
