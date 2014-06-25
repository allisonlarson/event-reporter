require 'pry'

class Entry

  attr_reader :regdate, :first_name, :last_name, :email_address, :street, :city, :state, :zipcode, :homephone

  def initialize(data)
    @id            = data[0]
    @regdate       = data[:regdate]
    @first_name    = clean_first_name(data[:first_name])
    @last_name     = clean_last_name(data[:last_name])
    @email_address = data[:email_address]
    @street        = data[:street]
    @city          = clean_city_name(data[:city])
    @state         = clean_state_name(data[:state])
    @zipcode       = clean_zipcode(data[:zipcode])
    @homephone     = clean_phonenumber(data[:homephone])
  end

  def clean_zipcode(zip_code)
    zip_code.to_s.rjust(5,"0")[0..4]
  end

  def clean_phonenumber(phone_number)
    digits = phone_number.scan(/\d/).join
    area_code  = digits[0..2]
    exchange   = digits[3..5]
    subscriber = digits[-4..-1]
    "(%s) %s-%s" % [area_code, exchange, subscriber]
  end

  def name
    "#{first_name} #{last_name}"
  end

  def address
    "#{street}, #{city}, #{state.upcase} #{zipcode}"
  end

  def clean_first_name(first_name)
    first_name.capitalize
  end

  def clean_last_name(last_name)
    last_name.capitalize
  end

  def clean_city_name(city)
    city.capitalize
  end

  def clean_state_name(state)
    state.capitalize
  end
end
