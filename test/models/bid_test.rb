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
    bid = Bid.create(user: users(:user), product: products(:one), amount: 10)
    bid2 = Bid.new(user: users(:user), product: products(:one), amount: 12)
    assert !bid2.valid?, "same user cannot bid two consecutive times"
  end

  test "same user can bid if another user bid after him" do
    bid = Bid.create(user: users(:user), product: products(:one), amount:10)
    bid2 = Bid.create(user: users(:user2), product: products(:one), amount:12)
    bid3 = Bid.new(user: users(:user), product: products(:one), amount:14)
    assert bid3.valid?, "user can bid if another user bid after him but: #{bid.errors.messages} #{bid2.errors.messages} #{bid3.errors.messages}"
  end

  test "user cannot bid after expiration date" do
    product = products(:expired) 
    bid = product.bids.build(user:users(:user), product:product) 
    assert !bid.valid?, "user cannot bid if the product is expired, #{bid.inspect}, expired= #{bid.product.expired?}"
  end





end
