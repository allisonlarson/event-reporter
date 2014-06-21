require 'minitest/autorun'
require 'minitest/pride'
require './lib/entry'
require 'pry'

class EntryTest<Minitest::Test
  def test_entry_attributes
    skip
    data  = {
      first_name: 'Alice',
      last_name: 'Smith',
      phone_number: '111.111.1111'
    }

    entry = Entry.new(data)

    assert_equal 'Alice', entry.first_name
    assert_equal 'Smith', entry.last_name
    assert_equal '111.111.1111', entry.phone_number
  end

  def test_zip_code_format
    skip
    entry = Entry.new
    zip_code1 = '0023'
    zip_code2 = '927058'
    zip_code3 = ''
    zip_code4 = '90210'

    assert_equal '00023', entry.clean_zipcode(zip_code1)
    assert_equal '92705', entry.clean_zipcode(zip_code2)
    assert_equal '00000', entry.clean_zipcode(zip_code3)
    assert_equal '90210', entry.clean_zipcode(zip_code4)
  end

  def test_phone_number_format
    skip
    entry = Entry.new
    data = {
      phone_number1 = '6154385000'
      # phone_number2 = '9.82E+00' Ask about this
      phone_number2 = '206-226-3000'
      phone_number3 = '510 282 4000'
      phone_number4 = '214.794.2000'
      phone_number5 = '(717) 754-3000'
    }

    assert_equal '(615) 438-5000', entry.clean_phonenumber(phone_number1)
    assert_equal '(206) 226-3000', entry.clean_phonenumber(phone_number2)
    assert_equal '(510) 282-4000', entry.clean_phonenumber(phone_number3)
    assert_equal '(214) 794-2000', entry.clean_phonenumber(phone_number4)
    assert_equal '(717) 754-3000', entry.clean_phonenumber(phone_number5)
  end

  def test_clean_incoming_data

    data = {
      zipcode: "030",
      phonenumber: "(555) 756.0000"
    }
    entry = Entry.new(data)
    # binding.pry
    assert_equal "00030", entry.zipcode
    assert_equal '(555) 756-0000', entry.phonenumber
  end
end
