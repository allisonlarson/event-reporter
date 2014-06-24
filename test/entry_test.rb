require 'minitest/autorun'
require 'minitest/pride'
require './lib/entry'
require 'pry'

class EntryTest<Minitest::Test

  def data
    {first_name: "Allison", last_name: "Larson", zipcode: "89009", homephone: "(454) 567-7890"}
  end

  def test_clean_incoming_data

    info = {
      zipcode: "030",
      homephone: "(555) 756.0000"
    }

    entry = Entry.new(info)

    assert_equal "00030", entry.zipcode
    assert_equal '(555) 756-0000', entry.homephone
  end

  def test_can_retrieve_first_Name_from_attendees
    entry = Entry.new(data)

    assert_equal "Allison", entry.first_name
  end


end
