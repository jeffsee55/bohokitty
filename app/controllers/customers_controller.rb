class CustomersController < ApplicationController

  def create
    @customer = Customer.find_or_create_by(email: params[:email])
  end

  def new
    @customer = Customer.new
  end

end
