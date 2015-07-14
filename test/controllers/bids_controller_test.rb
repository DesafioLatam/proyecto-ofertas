require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "guest shouldnt create bids" do
    user = users(:guest)
    sign_in user

    post :create, bid: {user_id: user, product_id: products(:three)}, product_id: products(:three)    
    assert_equal 2, Bid.count
    assert_redirected_to root_path
  end

  test "user should create bids" do
    user = users(:user2)
    sign_in user

    assert_difference('Bid.count') do
      post :create, bid: {user_id: user.id, product_id: products(:three).id, amount: 10}, product_id: products(:three)    
    end

    assert_redirected_to products_path
  end

  test "seller shouldnt create bids" do
    user = users(:seller)
    post :create, bid: {user_id: user, product_id: products(:three)}, product_id: products(:three)    
    assert_equal 2, Bid.count
    assert_redirected_to root_path
  end
end
