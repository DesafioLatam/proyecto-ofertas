require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "guest shouldnt create bids" do
    user = users(:guest)
    sign_in user

    post :create
    assert_redirected_to landing_page_path
  end

  test "user should create bids" do
    post :create
    assert_redirected_to products_path
  end

  test "seller shouldnt create bids" do
    post :create
    assert_response :success
  end
end
