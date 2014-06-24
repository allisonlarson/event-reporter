require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/container'
require './lib/entry'
require 'pry'

class ContainerTest<Minitest::Test

  attr_reader :container

  def setup
    @container = Container.load('./test_attendees.csv')
  end

  def test_it_finds_by_first_name
    entries = container.find_by_first_name("Aya")
    assert_equal 1 , entries.length
    entries.each do |entry|
      assert_equal "Aya", entry.first_name
    end
  end

  def test_it_finds_by_last_name
    entries = container.find_by_last_name("Nguyen")
    assert_equal 1 , entries.length
    entries.each do |entry|
      assert_equal "Nguyen", entry.last_name
    end
  end

  def test_it_finds_by_state
    entries = container.find_by_state("YK")
    assert_equal 1 , entries.length
    entries.each do |entry|
      assert_equal "YK", entry.state
    end
  end

  def test_it_finds_by_zipcode
    entries = container.find_by_zipcode("14841")
    assert_equal 1 , entries.length
    entries.each do |entry|
      assert_equal "14841", entry.zipcode
    end
  end

  def test_it_finds_by_city
    entries = container.find_by_city("Lyndeborough")
    assert_equal 1 , entries.length
    entries.each do |entry|
      assert_equal "Lyndeborough", entry.city
    end
  end

  def test_finds_multiple_entries
    entries = container.find_by_first_name("Shannon")
    assert_equal 2 , entries.length
    entries.each do |entry|
      assert_equal "Shannon", entry.first_name
    end
  end
end
