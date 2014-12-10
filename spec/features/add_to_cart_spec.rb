require 'spec_helper'
require 'rails_helper'

describe "When adding a product to a cart" do
  let(:product) { create(:product) }

  context "the page" do
    it "should display an Add to Cart button" do
      visit product_path(product)

      expect(page).to have_button('ADD TO CART')
    end
  end

  describe "the product" do
    before :each do
      visit product_path(product)
      click_button 'ADD TO CART'
      get(:cart, :cart => [{product_id:product.id, qty: 1}] )
    end

    it "should be added to the cart" do
      visit cart_path
      
    end
  end
end
