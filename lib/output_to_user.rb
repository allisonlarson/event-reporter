class OutputToUser
  def self.prompt
    "Enter Command: "
  end

  def self.quit
    "Exiting the Event Reporter. Goodbye!"
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
    "Results in queue:     "
  end

  def self.clear
    "Queue has been cleared."
  end

  def self.find
    "Your search has been placed in queue."
  end
end
