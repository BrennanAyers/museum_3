require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'
class MuseumTest < Minitest::Test
  def setup
    @denver = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
  end

  def test_it_exists
    assert_instance_of Museum, @denver
  end

  def test_it_has_a_name_and_no_exhibits_initially
    assert_equal "Denver Museum of Nature and Science", @denver.name
    assert_equal [], @denver.exhibits
  end
end
