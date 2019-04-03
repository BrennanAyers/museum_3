require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'
class MuseumTest < Minitest::Test
  def setup
    @denver = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
    @bob = Patron.new("Bob", 20)
    @sally = Patron.new("Sally", 20)
  end

  def test_it_exists
    assert_instance_of Museum, @denver
  end

  def test_it_has_a_name_and_no_exhibits_initially
    assert_equal "Denver Museum of Nature and Science", @denver.name
    assert_equal [], @denver.exhibits
  end

  def test_it_can_add_exhibits
    @denver.add_exhibit(@gems_and_minerals)
    @denver.add_exhibit(@dead_sea_scrolls)
    @denver.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @denver.exhibits
  end

  def test_it_can_suggest_exhibits_for_patrons
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    @sally.add_interest("IMAX")

    @denver.add_exhibit(@gems_and_minerals)
    @denver.add_exhibit(@dead_sea_scrolls)
    @denver.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls], @denver.recommend_exhibits(@bob)
    assert_equal [@imax], @denver.recommend_exhibits(@sally)
  end

  def test_it_can_admin_patrons
    assert_equal [], @denver.patrons

    @denver.admit(@bob)
    @denver.admit(@sally)

    assert_equal [@bob, @sally], @denver.patrons
  end

end
