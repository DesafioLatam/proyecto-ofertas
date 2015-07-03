class BidsController < ApplicationController
  load_and_authorize_resource
  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.build(bid_params)
    @bid.save
    redirect_to root_path
  end

  private
  def bid_params
    params.require(:bid).permit(:amount)
  end

end
