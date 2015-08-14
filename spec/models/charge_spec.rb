require 'rails_helper'

RSpec.describe Charge, :type => :model do
  it{should validate_presence_of :token}
  it{should validate_presence_of :email}
  it{should validate_presence_of :amount}
end
