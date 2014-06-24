require 'pry'
class List
  attr_reader :queue

  def initialize
    @queue = Array.new
  end

  def adds_entrys(entry)
    if entry.length < 0
      add(entry)
    else
      append(entry)
    end
  end

  def add(entry)
    @queue << entry
  end

  def append(entries)
    @queue += entries
  end

  def clear
    @queue = []
  end

  def length
    queue.length
  end

  def each(&block)
    queue.each(&block)
  end

  def empty?
    queue.empty?
  end

  def print_header
    header = "\tLAST NAME\tFIRST NAME\tEMAIL\tZIP\tCITY\tSTATE\tADDRESS\tPHONE\n\n"
    print header.center(50)
    info = @queue.each do |entry|
      puts "#{entry[:last_name]}\t#{entry[:first_name]}\t#{entry[:email_address]}\t#{entry[:zipcode]}\t#{entry[:city]}\t#{entry[:state]}\t#{entry[:street]}\t#{entry[:homephone]}"
    end
    print info.center(50)
  end

  def filter_by(attribute)
    queue.sort_by! do |entry|
      entry[attribute]
    end
  end

end
