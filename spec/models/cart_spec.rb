require 'rails_helper'

RSpec.describe Cart, :type => :model do
  it { should belong_to(:customer) }
  it { should have_many(:products).through(:cart_products) }
end
