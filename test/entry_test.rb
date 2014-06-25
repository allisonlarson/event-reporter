require 'minitest/autorun'
require 'minitest/pride'
require './lib/entry'
require 'pry'

class EntryTest<Minitest::Test

  def data
    {
    first_name: "ALLison",
    last_name: "LARson",
    email_address: 'allie@gmail.com',
    street: '123 Main',
    city: 'DEnver',
    state: 'CO',
    zipcode: "89009",
    homephone: "(454) 567-7890"}
  end

  def test_it_cleans_zipcodes

    zipcode_short = "030"
    zipcode_long = "5544321"
    zipcode_correct = "80201"

    entry = Entry.new(data)

    assert_equal "00030", entry.clean_zipcode(zipcode_short)
    assert_equal "55443", entry.clean_zipcode(zipcode_long)
    assert_equal "80201", entry.clean_zipcode(zipcode_correct)
  end

  def test_it_cleans_phonenumbers

    phone_number_solid = "0000000000"
    phone_number_dashes ="111-111-1111"
    phone_number_parenthesis = "(222)(222)2222"
    phone_number_spaces = "333 333 3333"
    phone_number_periods = "444.444.4444"
    phone_number_correct = "(555) 555-5555"

    entry = Entry.new(data)

    assert_equal "(000) 000-0000", entry.clean_phonenumber(phone_number_solid)
    assert_equal "(111) 111-1111", entry.clean_phonenumber(phone_number_dashes)
    assert_equal "(222) 222-2222", entry.clean_phonenumber(phone_number_parenthesis)
    assert_equal "(333) 333-3333", entry.clean_phonenumber(phone_number_spaces)
    assert_equal "(444) 444-4444", entry.clean_phonenumber(phone_number_periods)
    assert_equal "(555) 555-5555", entry.clean_phonenumber(phone_number_correct)
  end

  def test_can_retrieve_first_Name_from_attendees
    entry = Entry.new(data)

    assert_equal "Allison", entry.first_name
  end

  def test_can_retrieve_information_from_attendee
    entry = Entry.new(data)

    assert_equal "Allison", entry.first_name
    assert_equal "Denver", entry.city
    assert_equal "89009", entry.zipcode
  end

  def test_full_name
    entry = Entry.new(data)

    assert_equal "Allison Larson", entry.name
  end

  def test_full_address
    entry = Entry.new(data)

    assert_equal "123 Main, Denver, CO 89009", entry.address
  end

  def test_entry_missing_information
    entry = Entry.new(data)

    assert_equal nil, entry.regdate
  end

  def test_first_name_is_formatted
    entry = Entry.new(data)

    assert_equal "Allison", entry.first_name
  end

  def test_last_name_is_formatted
    entry = Entry.new(data)

    assert_equal "Larson", entry.last_name
  end

  def test_city_is_formatted
    entry = Entry.new(data)

    assert_equal "Denver", entry.city
  end

  def test_state_is_formatted
    entry = Entry.new(data)

    assert_equal "Co", entry.state
  end
end
