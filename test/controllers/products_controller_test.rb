require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "signed_in user should get index" do
    user = users(:user)
    sign_in user

    get :index
    assert_response :success

    assert_not_nil assigns(:products)
  end

  test "not signed_in user redirected to landing" do
    get :index
    assert_redirected_to root_path 
  end

end
