require 'test/unit'
require_relative './account'

class AccountTest < Test::Unit::TestCase

  def test_gamma
    assert_equal 68680, Account.new(10).gamma(10, 100, 1000)
  end
end
