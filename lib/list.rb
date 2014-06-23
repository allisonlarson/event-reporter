require 'pry'
class List
  attr_reader :queue

  def initialize(container=Container.load('./test_attendees.csv'))
    @queue = []
    @container = container
  end

  def add(entry)
    @queue << entry
  end

  def find(attribute, criteria)
    @queue = []
    entry = @container.find(attribute, criteria)
    add(entry)
  end

  def clear
    @queue = []
    end
end
