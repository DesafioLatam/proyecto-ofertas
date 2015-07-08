class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to users_dashboard_path
    else 
      render json: @product
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
