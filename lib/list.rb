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
end
