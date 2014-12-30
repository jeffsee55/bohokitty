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
    end

    it "should be added to the cart" do
      visit cart_path

      within('tbody') do
        expect(page).to have_content(product.name)
      end
    end

    describe "and when adjusting the quantity" do
      it "should increase the quantity by one" do
        visit cart_path
        click_button "ADD ITEM"

        within ".qty" do
          expect(page).to have_content('2')
        end
      end

      it "should descrease the quantity by one" do
        visit cart_path
        click_button "ADD ITEM"
        click_button "REMOVE ITEM"

        within ".qty" do
          expect(page).to have_content('1')
        end
      end

      it "should redirect to the collections page when empty" do
        visit cart_path
        click_button "REMOVE ITEM"

        expect(current_path).to eq(products_path)
      end
    end
  end
end
