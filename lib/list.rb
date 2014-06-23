require 'pry'
class List
  attr_reader :queue
  attr_accessor :container

  def initialize
    @queue = []
  end

  def add(entry)
    @queue << entry
  end

  def append(entries)
    @queue += entries
  end

  def find(attribute, criteria)
    @queue = []
    entry = container.find(attribute, criteria)
    append(entry)
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
end
