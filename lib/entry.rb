require 'pry'

class Entry

  attr_reader :regdate, :first_name, :last_name, :email_address, :street, :city, :state, :zipcode, :homephone

  def initialize(data)
    @id            = data[0]
    @regdate       = data[:regdate]
    @first_name    = data[:first_name].capitalize
    @last_name     = data[:last_name].capitalize
    @email_address = data[:email_address]
    @street        = data[:street]
    @city          = data[:city]
    @state         = data[:state].upcase
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
end
