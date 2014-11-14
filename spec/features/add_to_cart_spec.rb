require 'spec_helper'
require 'rails_helper'

describe "When adding a product to a cart" do
  let(:customer) { create(:customer) }
  let(:product) { create(:product) }

  context "the page" do
    it "should display an Add to Cart button" do
      visit product_path(product)

      expect(page).to have_button('Add to Cart')
    end

    it "should have the correct product" do
    end
  end

  describe "the cart_product" do
    before :each do
      visit product_path(product)
      fill_in :email, with: customer.email
      click_button 'Add to Cart'
    end

    it "should be created" do
      expect(CartProduct.count).to eq(1)
    end

    it "should have the correct customer" do
      expect(CartProduct.last.cart.customer).to eq(customer)
    end

    context "the response" do
      it "should redirect to the cart#show page" do
        cart = Cart.where(customer_id: customer.id).last

        expect(page.current_path).to eq(cart_path(cart))
      end
    end
  end
end
