class OutputToUser
  def self.welcome
    print ("Welcome to Event Reporter\n").center(100)
  end

  def self.prompt
    print ("Enter Command: ")
  end

  def self.quit
    print "Exiting the Event Reporter. Goodbye!\n"
  end

  def self.invalid
    "Unrecognized input. Type 'help' for a menu of attributes and commands."
  end

  def self.loaded
    "Successfully loaded file."
  end

  def self.load_error
    "Sorry. That file could not be loaded."
  end

  def self.bad_attribute
    "Sorry. Type 'help' for a menu of attributes and commands."
  end

  def self.criteria_empty
    "Sorry. Couldn't find by that criteria. Type 'help' for a menu of attributes and commands."
  end

  def self.count
    print "Results in queue:     "
  end

  def self.clear
    print "Queue has been cleared.\n"
  end

  def self.find
    print "Your search has been placed in queue.\n"
  end

  def self.help
    puts title = "Help Menu".center(100)
  end
end
