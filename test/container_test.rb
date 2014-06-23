require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/container'
require './lib/entry'
require 'pry'

class ContainerTest<Minitest::Test

  def test_it_finds_by_attribute
    container = Container.load('./test_attendees.csv')
    entries = container.find(:zipcode, '90210')
    assert_equal 1, entries.length
    assert_equal 'Aya', entries[0].first_name
  end

  def test_finds_multiple_entries
    container = Container.load('./test_attendees.csv')
    entries = container.find(:first_name, 'Shannon')
    assert_equal 2 , entries.length
    assert_equal true, entries.is_a?(Array)
  end
end
