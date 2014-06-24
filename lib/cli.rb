require_relative 'list'
require_relative 'container'
require 'pry'
require_relative "output_to_user"


class CLI
  attr_reader :container, :list, :command

  def initialize
    @container  = []
    @list       = List.new
    @command    = ''
  end

  def process_input(input)
    input.split
  end

  def run
    OutputToUser.welcome
    OutputToUser.prompt
    input = gets.strip
    until input == 'quit'
      @command = process_input(input)
      assigns_instructions
      input = gets.strip
    end
  end

  def assigns_instructions
    instruction = command[0]
      case instruction
      when 'load'  then load_parse
      when 'find'  then find
      when 'queue' then queue
      when 'help'  then help
      end
  end

  def find
    attribute = command[2]
    criteria = command[3]
    clear
    case attribute
    when 'first_name' then add(container.find_by_first_name(criteria))
    when 'last_name'  then add(container.find_by_last_name(criteria))
    when 'state'      then add(container.find_by_last_name(criteria))
    when 'zipcode'    then add(container.find_by_zipcode(criteria))
    when 'city'       then add(container.find_by_city(criteria))
    end
  end

  def queue
    instruct = command[1]
    attribute = command[3]
    if instruct == 'by'
      print_by(attribute)
    end
    case instruct
    when 'count'    then length
    when 'clear'    then clear
    when 'print'    then prints
    end
  end

  def prints
    list.prints
  end

  def print_by(attribute)
    list.filter_by(attribute)
    list.prints
  end

  def load_parse
    if command.length >= 1
      file = command[1]
      load(file)
    else
      load
    end
  end

  def load(filename = './test_attendees.csv')
    @filename = filename
    @container = Container.load(@filename)
  end

  def length
    puts list.length
  end

  def each(&block)
    list.each(&block)
  end

  def clear
    list.clear
  end

  def add(entry)
    list.adds_entrys(entry)
  end

  def help
    puts "something!"
  end

  # def find_by_first_name(name)
  #   list.clear
  #   entries = container.find_by_first_name(name)
  #   list.append(entries)
  # end
  #
  # def find_by_last_name(name)
  #   list.clear
  #   entries = container.find_by_last_name(name)
  #   list.append(entries)
  #   binding.pry
  # end
  #
  # def find_by_state(state)
  #   list.clear
  #   entries = container.find_by_state(state)
  #   list.append(entries)
  # end
  #
  # def find_by_zipcode(zipcode)
  #   list.clear
  #   entries = container.find_by_zipcode(zipcode)
  #   list.append(entries)
  # end
  #
  # def find_by_city(city)
  #   list.clear
  #   entries = container.find_by_city(city)
  #   list.append(entries)
  # end

end
t = CLI.new
t.run
