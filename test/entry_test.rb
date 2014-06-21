require 'minitest/autorun'
require 'minitest/pride'
require './lib/entry'
require 'pry'

class EntryTest<Minitest::Test

  def test_clean_incoming_data

    data = {
      zipcode: "030",
      phonenumber: "(555) 756.0000"
    }

    entry = Entry.new(data)

    assert_equal "00030", entry.zipcode
    assert_equal '(555) 756-0000', entry.phonenumber
  end
end
