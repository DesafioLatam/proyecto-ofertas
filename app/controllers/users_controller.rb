class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @products = @user.products
    @bids_with_products = @products
      .includes(:bids)
      .group("products.name, bids.product_id")
      .order('count_bids DESC')
      .pluck('products.name, count(bids.id) as count_bids')
  end

  def buy_credits
  end

  def process_credits
    current_user.credits += params[:amount]
    render json: params
  end

  def get_address
    user = User.new(latitude: params[:latitude], longitude: params[:longitude])
    user.reverse_geocode
    @address = user.address
    respond_to do |format|
      format.js
    end
    #render json:params
  end

end
