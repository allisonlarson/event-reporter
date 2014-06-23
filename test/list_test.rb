require 'minitest/autorun'
require 'minitest/pride'
require './lib/list'
require './lib/container'
require './lib/entry'
require 'pry'

class ListTest< Minitest::Test

  def test_it_holds_entrys_and_counts_them
    list = List.new
    entry1 = 'Jim'
    entry2 = 'Phil'
    list.add(entry1)
    list.add(entry2)
    assert_equal 2, list.length
  end

  def test_it_appends_entries_to_the_queue
    list = List.new
    entries_1 = 'Jim'
    entries_2 = ['Phil', 'Mary']
    list.add(entries_1)
    list.append(entries_2)
    assert_equal 3, list.length
  end

  def test_list_clears_when_new_search_is_initiated
    list = List.new
    list.find(:first_name, "Allison")
    assert_equal 1, list.length
    list.find(:first_name, "Shannon")
    assert_equal 2, list.length
  end

  # def test_it_can_find_entry_by_attribute
  #   list      = List.new
  #   list.find(:first_name, "Allison")
  #   assert_equal "Allison", list.queue[0][0].first_name
  # end
  #
  # def test_it_can_clear_entry
  #   list  = List.new
  #   list.find(:first_name, "Allison")
  #   list.clear
  #   assert true, list.queue.empty?
  # end
end
