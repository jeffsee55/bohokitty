require 'spec_helper'
require 'rails_helper'
require 'stripe_mock'

describe "When trying to make a charge" do
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }
  let(:customer) { create(:customer) }

  describe "the new charge page" do
    before :each do
      visit product_path(product)
      fill_in :email, with: customer.email
      click_button 'Add to Cart'
      click_link 'Proceed to Checkout'
    end

    it "should have a the credit card form" do
      expect(page).to have_css("#credit_card_number")
    end

    it "should have an address form" do
      expect(page).to have_css("#address_line1")
    end

    describe "submitting the incomplete form" do
    end

    describe "submitting the complete form" do
      let(:stripe_helper) { StripeMock.create_test_helper }
      before :each do
        StripeMock.start
      end
      after :each do
        StripeMock.stop
      end

      it "creates a Stripe customer" do
        stripe_customer = Stripe::Customer.create(
          email: customer.email,
          card: stripe_helper.generate_card_token
        )
        expect(stripe_customer.email).to eq(customer.email)
      end


    end
  end

end
