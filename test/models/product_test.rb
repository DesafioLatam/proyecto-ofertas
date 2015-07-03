require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:one)
  end

  test "should have a name" do
    @product.name = nil

    assert_not @product.valid?, "name cannot be nil"
  end

  test "should have a price" do
    @product.price = nil

    assert_not @product.valid?, "price cannot be nil"
  end

  test "should have a price > 0" do
    @product.price = 0

    assert_not @product.valid?, "price must be > 0"
  end
end
