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
      click_button 'ADD TO CART'
      visit cart_path
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
        within "#payment-form" do
          fill_in :name, with: "Jeff"
          fill_in :charge_email, with: "jeff@user.com"
          fill_in :credit_card_number, with: '4242424242424242'
          fill_in :exp_month, with: '10'
          fill_in :exp_year, with: "2020"
          fill_in :cvc, with: '123'
          fill_in :address_line1, with: '123 Street'
          fill_in :address_city, with: 'City'
          fill_in :address_state, with: 'NM'
          fill_in :address_zip, with: '12345'
          fill_in :address_country, with: "USA"
          page.find('.modal-purchase').click
        end
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

      it "creates a charge" do
        expect(Charge.all.count).to increase.by(1)
      end
    end
  end

end
