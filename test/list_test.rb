require 'minitest/autorun'
require 'minitest/pride'
require './lib/list'
require './lib/container'
require './lib/entry'
require 'pry'

class ListTest< Minitest::Test
  attr_reader :list

  def setup
    @list = List.new
  end
  
  def assert_empty(list)
    assert list.empty?, "Expected the list to be empty but instead it is: #{list.inspect}."
  end

  def assert_not_empty(list)
    refute list.empty?, "Expected the list to have entries but it is empty."
  end

  def test_it_adds_to_the_queue
    entry_1 = "bill"
    list.add(entry_1)
    entry_2 = "tom"
    list.add(entry_2)
    assert_equal 2, list.length
  end

  def test_it_appends_entries_to_the_queue
    entries_1 = 'Jim'
    entries_2 = ['Phil', 'Mary']
    starter_length = list.length
    list.add(entries_1)
    list.append(entries_2)
    assert_equal 3, list.length - starter_length
  end

  def test_it_can_clear_entries
    entry = "allison"
    list.add(entry)
    assert_not_empty list
    list.clear
    assert_empty list
  end

  def test_it_adds_or_appends_entries_appropriately
    entry = ['steve', 'jim']
    entry_2 = ['allison', 'nancy']
    list.adds_entrys(entry)
    list.adds_entrys(entry_2)
    assert_not_empty list
    assert_equal 4, list.length
  end

  def test_it_can_sort_by_attribute

    e1 = {zipcode: "02000", last_name: "Larson"}
    e2 = {zipcode: "00000", last_name: "Hatch"}
    e3 = {zipcode: "12345", last_name: "Riker"}

    list.adds_entrys([e1, e2, e3])
    expectation = [e2, e1, e3]
    list.filter_by(:zipcode)
    assert_equal expectation, list.queue
  end

  def test_it_will_sort_by_first_name_after_last_name
    skip
    e1 = {last_name: "Jones", first_name: "Becky"}
    e2 = {last_name: "Alpha", first_name: "Tiny"}
    e3 = {last_name: "Jones", first_name: "Aida"}

    list.adds_entrys([e1, e2, e3])
    assert_equal [e2, e3, e1], list.filter_by(:last_name)
  end

end
