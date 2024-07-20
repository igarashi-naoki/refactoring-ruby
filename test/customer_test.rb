require 'minitest/autorun'
require_relative '../chapter1/customer'
require_relative '../chapter1/movie'
require_relative '../chapter1/rental'

# rubocop:disable Layout/LineLength, Metrics/MethodLength, Metrics/AbcSize
class CustomerTest < Minitest::Test
  def test_statement
    customer = Customer.new('John')
    movie = Movie.new('Star Wars', RegularPrice.new)
    rental = Rental.new(movie, 3)
    customer.add_rental(rental)
    assert_equal "Rental Record for John\n\tStar Wars\t3.5\nAmount owed is 3.5\nYou earned 1 frequent renter points", customer.statement

    movie_avatar = Movie.new('Avatar', NewReleasePrice.new)
    rental_avatar = Rental.new(movie_avatar, 5)
    customer.add_rental(rental_avatar)
    assert_equal "Rental Record for John\n\tStar Wars\t3.5\n\tAvatar\t15\nAmount owed is 18.5\nYou earned 3 frequent renter points", customer.statement

    movie_toy_story = Movie.new('Toy Story', ChildrensPrice.new)
    rental_toy_story = Rental.new(movie_toy_story, 2)
    customer.add_rental(rental_toy_story)
    assert_equal "Rental Record for John\n\tStar Wars\t3.5\n\tAvatar\t15\n\tToy Story\t1.5\nAmount owed is 20.0\nYou earned 4 frequent renter points", customer.statement
  end
end
# rubocop:enable Layout/LineLength, Metrics/MethodLength, Metrics/AbcSize
