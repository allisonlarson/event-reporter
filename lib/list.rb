require 'pry'
class List
  attr_reader :queue
  attr_accessor :container

  def initialize
    @queue = Array.new
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
end
