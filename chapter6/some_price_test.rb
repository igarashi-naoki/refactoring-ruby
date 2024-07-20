require 'test/unit'
require_relative './some_price'

class SomePriceTest < Test::Unit::TestCase

  def test_price
    a_price = SomePrice.new(10, 100)
    assert_equal 980, a_price.price

    a_price = SomePrice.new(10, 200)
    assert_equal 1900, a_price.price
  end
end
