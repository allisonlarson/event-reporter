require 'colorize'
class OutputToUser

  def self.welcome
    puts
    print ("Welcome to Event Reporter\n").center(100)
    puts
  end

  def self.prompt
    print ("Enter Command: ").ljust(15)
  end

  def self.quit
    print "Exiting the Event Reporter. Goodbye!\n"
  end

  def self.loaded(filename)
    print "Successfully loaded '#{filename}'\n"
  end

  def self.count(number)
    print "Results in queue:     #{number}\n"
  end

  def self.clear
    print "Queue has been cleared.\n"
  end

  def self.find
    print "Your search has been placed in queue.\n"
  end

  def self.help
    puts title = "Help Menu".colorize(:yellow).center(115)
    puts subtitle = "You may enter the following commands:".center(100)
    puts
    puts "load".colorize(:cyan)+" / "+"load <filename>".colorize(:cyan)
    puts "find <attribute> <criteria>".colorize(:cyan)
    puts "queue count".colorize(:cyan)+" / "+ "queue clear".colorize(:cyan)+" / "+ "queue print".colorize(:cyan)+" / "+"queue print by <attribute>".colorize(:cyan)+" / "+"queue save to <filename>".colorize(:cyan)
    puts "help <command>".colorize(:cyan)
    puts "quit".colorize(:cyan)
    puts
  end

  def self.help_load
    puts "Enter "+"load <filename>".colorize(:cyan)+" to retrieve information from a csv file to search. If no file is provided, "+"test_attendees.csv".colorize(:yellow)+" will load."
    puts
  end

  def self.help_find_by
    puts "Enter "+"find <attribute> <criteria>".colorize(:cyan)+" to search a previously loaded file, and place founds entries in "+"queue".colorize(:yellow)+".
    Entries can be searched by the attributes "+"first_name".colorize(:cyan)+", "+"last_name".colorize(:cyan)+", "+"city".colorize(:cyan)+", "+"state".colorize(:cyan)+", and "+"zipcode".colorize(:cyan)+". "+"Queue".colorize(:yellow)+" will "+"clear".colorize(:yellow)+" when a new search is initiated."
    puts
  end

  def self.help_queue_count
    puts "Enter "+"queue_count".colorize(:cyan)+" to return the number of entrys in the "+"queue".colorize(:yellow)+", found in the previous search."
    puts
  end

  def self.help_queue_clear
    puts "Enter "+"queue_clear".colorize(:cyan)+" to delete all entries in current "+"queue".colorize(:yellow)+". "+"Queue".colorize(:yellow)+" automatically "+"clears".colorize(:yellow)+" when new search is initiated."
    puts
  end

  def self.help_queue_print
    puts "Enter "+"queue_print".colorize(:cyan)+" to print all entries in current "+"queue".colorize(:yellow)+". Entries will be organized by order of original file.
    Entries can be organized by "+"first_name".colorize(:cyan)+", "+"last_name".colorize(:cyan)+", "+"city".colorize(:cyan)+", "+"state".colorize(:cyan)+", and "+"zipcode".colorize(:cyan)+"."
    puts
  end

  def self.help_command
    puts "Enter "+"help <command>".colorize(:cyan)+" for a detailed explaination of specific command functions. Like this."
    puts
  end

  def self.help_quit
    puts "Enter "+"quit".colorize(:cyan)+" at any time to quit program. Your mileage may vary."
    puts
  end

  def self.help_queue_save
    puts "Enter "+"queue save to <filename>".colorize(:cyan)+" to save contents of "+"queue".colorize(:yellow)+" to new file."
  end

end
