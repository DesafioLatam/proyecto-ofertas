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


  test "same user cannot bid two consecutive times" do
    @bid = Bid.create(user: users(:user), product: products(:one))
    @bid2 = Bid.new(user: users(:user), product: products(:one))
    assert !@bid2.valid?, "same user cannot bid two consecutive times"
  end

  test "same user can bid if another user bid after him" do
    @bid = Bid.create(user: users(:user), product: products(:one))
    @bid2 = Bid.create(user: users(:user2), product: products(:one))
    @bid3 = Bid.new(user: users(:user), product: products(:one))
    assert @bid3.valid?, "user can bid if another user bid after him but: #{@bid.errors.messages} #{@bid2.errors.messages} #{@bid3.errors.messages}"
  end



end
