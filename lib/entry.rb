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
    @city          = clean_city(data[:city])
    @state         = data[:state]
    @zipcode       = clean_zipcode(data[:zipcode])
    @homephone     = clean_phonenumber(data[:homephone])
  end

  def clean_zipcode(zip_code)
    zip_code.to_s.rjust(5,"0")[0..4]
  end

  def clean_phonenumber(phone_number)
    if phone_number != nil
      digits = phone_number.scan(/\d/).join
      area_code  = digits[0..2]
      exchange   = digits[3..5]
      subscriber = digits[-4..-1]
      "(%s) %s-%s" % [area_code, exchange, subscriber]
    else
      phone_number
    end
  end

  def clean_city(cities)
    if cities != nil
      cities.split.map {|word| word.capitalize}.join(' ')
    else
      cities
    end
  end

  def clean_state(state)
    if state != nil
      state.upcase
    else
      state
    end
  end

  def clean_first_name(name)
    if name != nil
      name.capitalize
    else
      name
    end
  end

  def clean_last_name(name)
    if name != nil
      name.capitalize
    else
      name
    end
  end

end
