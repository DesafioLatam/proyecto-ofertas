require 'test_helper'

class BidTest < ActiveSupport::TestCase
  def setup
    @bid = bids(:one)
  end

  # test "the truth" do
  #   assert true
  # end
  test 'should have an user' do
    @bid.user = nil
    assert_not @bid.valid?
  end

  test 'should have a product' do
    @bid.product = nil
    assert_not @bid.valid?
  end


end
