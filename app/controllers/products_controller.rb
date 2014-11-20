class ProductsController < ApplicationController
  before_action :set_product, only: :show
  layout :resolve_layout

  def index
    @products = Product.all
  end

  def show
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def resolve_layout
      case action_name
      when "show"
        "layouts/basic"
      when "index"
        "layouts/grid"
      else
        "application"
      end
    end

end
