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
end
