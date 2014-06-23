require 'minitest/autorun'
require 'minitest/pride'
require './lib/entry'
require 'pry'

class EntryTest<Minitest::Test

  def data
      {first_Name: "Allison", last_Name: "Larson", zipcode: "89009", homephone: "(454) 567-7890"}
      # {first_Name: "Tim", last_Name: "Proctor", zipcode: "67897", phonenumber: "(123) 456-8908"},
      # {first_Name: "John", last_Name: "Smith", zipcode: "12345", phonenumber: "(345) 456-7890"}
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

    assert_equal "Allison", entry.first_Name
  end


end
