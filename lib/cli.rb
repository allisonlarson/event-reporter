require_relative 'list'
require_relative 'container'

class CLI
  attr_reader :container, :list

  def initialize
    @container = []
    @list = List.new
  end

  def load(filename)
    @container = Container.load(filename)
  end

  def length
    list.length
  end

  def each(&block)
    list.each(&block)
  end

  def find_by_first_name(name)
    list.clear
    entries = container.find_by_first_name(name)
    list.append(entries)
  end

  def find_by_last_name(name)
    list.clear
    entries = container.find_by_last_name(name)
    list.append(entries)
  end

  def find_by_state(state)
    list.clear
    entries = container.find_by_state(state)
    list.append(entries)
  end

  def find_by_zipcode(zipcode)
    list.clear
    entries = container.find_by_zipcode(zipcode)
    list.append(entries)
  end

  def find_by_city(city)
    list.clear
    entries = container.find_by_city(city)
    list.append(entries)
  end
  


end
