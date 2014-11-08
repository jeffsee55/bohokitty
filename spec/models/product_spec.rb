require 'rails_helper'

RSpec.describe Product, :type => :model do
  it { should have_many(:carts).through(:cart_products) }

  it {should validate_presence_of(:name) }
  it {should validate_presence_of(:price) }
  it {should ensure_length_of(:description).is_at_most(120)}
end
