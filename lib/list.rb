require 'pry'
class List
  attr_accessor :queue

  def initialize
    @queue ||= Array.new
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

  def prints
    header = "LAST NAME".ljust(15) + "FIRST NAME".ljust(15) + "PHONE".ljust(15) + "ZIP".ljust(9) + "CITY".ljust(15) + "STATE".ljust(6) + "ADDRESS".ljust(30) + "EMAIL"
    puts
    puts header
    queue.each do |entry|
      puts
      print "#{entry.send(:last_name)}".ljust(15) + "#{entry.send(:first_name)}".ljust(15) + "#{entry.send(:homephone)}".ljust(15) + "#{entry.send(:zipcode)}".ljust(9) + "#{entry.send(:city)}".ljust(15)
      print  "#{entry.send(:state)}".ljust(6) + "#{entry.send(:street)}".ljust(30) + "#{entry.send(:email_address)}"
    end
    puts
  end

  def filter_by(attribute)
    queue.sort_by! do |entry|
      entry.send(attribute)
    end
  end

  def save(to_file="queue_save.csv")
    CSV.open(to_file, "w") do |file|
      # header = "LAST NAME".ljust(15) + "FIRST NAME".ljust(15) + "PHONE".ljust(15) + "ZIP".ljust(9) + "CITY".ljust(15) + "STATE".ljust(6) + "ADDRESS".ljust(30) + "EMAIL"
      # file.puts
      # file.puts header
      # queue.each do |entry|
      #   file.puts
      #   file.print "#{entry.send(:last_name)}".ljust(15) + "#{entry.send(:first_name)}".ljust(15) + "#{entry.send(:homephone)}".ljust(15) + "#{entry.send(:zipcode)}".ljust(9) + "#{entry.send(:city)}".ljust(15)
      #   file.print  "#{entry.send(:state)}".ljust(6) + "#{entry.send(:street)}".ljust(30) + "#{entry.send(:email_address)}"
      # end
      # file.puts
      file << ['RegDate','first_Name','last_Name','Email_Address','HomePhone','Street','City','State','Zipcode']
      queue.each do |entry|
        file << [entry.regdate, entry.first_name, entry.last_name, entry.email_address, entry.homephone, entry.street, entry.city, entry.state, entry.zipcode]
      end
    end
  end
end
