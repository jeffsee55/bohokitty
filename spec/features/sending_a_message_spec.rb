require 'spec_helper'
require 'rails_helper'

describe "When sending a message" do
  let!(:post) { create(:post) }
  let(:message) { create(:message) }

  context "from the contact page" do
    before :each do
      visit contact_path
    end

    it "should show the form" do
      expect(page).to have_css('#new_message')
    end

    it "should successfully submit" do
      fill_in "Name", with: "User"
      fill_in "Email", with: "user@example.com"
      fill_in "Message", with: "This is a test email"
      find("#message_product_id").find(:xpath, option[1]).select_option
      click_button "SUBMIT"

      expect(Message.last).to eq(message)
    end

    it "should have the correct content" do
    end
  end
end
