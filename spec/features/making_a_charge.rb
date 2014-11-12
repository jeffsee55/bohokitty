require 'spec_helper'
require 'rails_helper'

describe "When trying to make a charge" do
  let(:cart) { create(:cart) }

  it "should have the cart total" do
    visit cart_path(cart)
    click_button "Proceed to Checkout"

    expect(page).to have_content(cart.total)
  end

  it "should have a the credit card form" do
  end

  it "should have an address form" do
  end

  it "should require an email address" do
  end

  it "should be marked as recieved when the email has been confirmed" do
  end
end
