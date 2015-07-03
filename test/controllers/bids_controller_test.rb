require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "guest shouldnt create bids" do
    user = users(:guest)
    sign_in user

    post :create, bid: {user_id: user, product_id: products(:three)}, product_id: products(:three)    
    assert_equal 2, Bid.count
    assert_redirected_to landing_page_path
  end

  test "user should create bids" do
    user = users(:user)
    assert_difference('Bid.count') do
      post :create, bid: {user_id: user, product_id: products(:three)}, product_id: products(:three)    
    end
    assert_redirected_to products_path
  end

  test "seller shouldnt create bids" do
    user = users(:seller)
    post :create, bid: {user_id: user, product_id: products(:three)}, product_id: products(:three)    
    assert_equal 2, Bid.count
    assert_redirected_to landing_page_path
  end
end
