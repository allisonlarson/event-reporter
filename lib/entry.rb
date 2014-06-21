require 'pry'

class Entry


  def initialize
    # @rows = data_cleaned(rows)
  end


  def clean_zipcode(zip_code)
    zip_code.to_s.rjust(5,"0")[0..4]
  end

  def clean_phonenumber(phone_number)
    digits = phone_number.delete('.-').delete('()').gsub(/\s+/, '')
    area_code  = digits[0..2]
    exchange   = digits[3..5]
    subscriber = digits[-4..-1]
    "(%s) %s-%s" % [area_code, exchange, subscriber]
  end

  def clean_data(data)

    @zipcode = clean_zipcode(data[:zipcode])
    # @phonenumber = clean_phonenumber(data[:phonenumber])

  end


end
