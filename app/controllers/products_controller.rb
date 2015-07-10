class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:latitude] && params[:longitude]       
      @my_pos = User.new(latitude:params[:latitude], longitude: params[:longitude])
      sellers = @my_pos.nearbys(2).select(:id)
      sellers_id = sellers.collect(&:id)
      @products = Product.where("user_id in (?)", sellers_id)
    else
      @products = Product.all
    end

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
