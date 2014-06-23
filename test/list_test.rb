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
    @list.container = Container.load('./test_attendees.csv')
  end

  def test_it_appends_entries_to_the_queue
    entries_1 = 'Jim'
    entries_2 = ['Phil', 'Mary']
    starter_length = list.length
    list.add(entries_1)
    list.append(entries_2)
    assert_equal 3, list.length - starter_length
  end

  def test_list_clears_when_new_search_is_initiated
    list.find(:first_name, "Allison")
    assert_equal 1, list.length
    list.find(:first_name, "Shannon")
    assert_equal 2, list.length
  end

  def test_it_can_find_entry_by_attribute
    list.find(:first_name, "Allison")
    list.each do |entry|
      assert_equal "Allison", entry.first_name
    end
  end

  def assert_empty(list)
    assert list.empty?, "Expected the list to be empty but instead it is: #{list.inspect}."
  end

  def assert_not_empty(list)
    refute list.empty?, "Expected the list to have entries but it is empty."
  end

  def test_it_can_clear_entries
    list.find(:first_name, "Allison")
    assert_not_empty list
    list.clear
    assert_empty list
  end
end
