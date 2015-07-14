require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get landing" do
    get :landing
    assert_response :success
  end

end
