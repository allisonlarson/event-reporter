require_relative 'list'
require_relative 'container'
require 'pry'
require_relative "output_to_user"


class CLI
  attr_reader :container, :list, :command, :parameters

  def initialize
    @container  = []
    @list       = List.new
    @command    = ''
    @parameters = ''
  end

  def process_input
    input.downcase.split
  end

  def assigns_instructions
    instruction = process_input[0]
    until instruction == 'quit'
      case instruction
        when 'load' then loads
        when 'find' then find
        when 'queue' then queue
        when 'help' then help
      end
    end
  end

  # def run
  #   OutputToUser.welcome
  #   command = ''
  #
  #   until command = 'quit'
  #     OutputToUser.prompt
  #   end
  #
  # end


  def find
    clear
    case attribute
      when 'first_name' then {entry = container.find_by_first_name(criteria)}
      when 'last_name'  then {entry = container.find_by_last_name(criteria)}
      when 'state'      then {entry = container.find_by_last_name(criteria)}
      when 'zipcode'    then {entry = find_by_zipcode(criteria)}
      when 'city'       then {entry = container.find_by_city(criteria)}
    end
    add(entry)
  end

  def queue
    case command
      when 'print by' then print_by(attribute)
      when 'count'    then length
      when 'clear'    then clear
      when 'print'    then prints
      end
    end
  end

  def prints
    list.prints
  end

  def print_by(attribute)
    list.filter_by(attribute)
    list.prints
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

  def clear
    list.clear
  end

  def add(entry)
    list.add_entrys(entrys)
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
