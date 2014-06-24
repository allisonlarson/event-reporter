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

  def run
    OutputToUser.welcome
    OutputToUser.prompt
    input = gets.strip
    until input  == 'quit'
      @command = process_input(input)
      assigns_instructions
      input = gets.strip
    end
    puts "i'm out"
    abort
  end

  def process_input(input)
    input.downcase.split
  end

  def assigns_instructions(command)
      case command
      when 'load' then load_parse()
      when 'find' then find
      when 'queue' then queue
      when 'help' then help
      end
  end

  def length
    list.length
  end

  def load_parse
    load ||= load(process_input[1])
  end

  def find
    clear
    case attribute
    when 'first_name' then entry = container.find_by_first_name(criteria)
    when 'last_name'  then entry = container.find_by_last_name(criteria)
    when 'state'      then entry = container.find_by_last_name(criteria)
    when 'zipcode'    then entry = find_by_zipcode(criteria)
    when 'city'       then entry = container.find_by_city(criteria)
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

  def prints
    list.prints
  end

  def print_by(attribute)
    list.filter_by(attribute)
    list.prints
  end

  def load(filename = './test_attendees.csv')
      @container = Container.load(filename)
      puts OutputToUser.loaded
  end
# binding.pry

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
end


t = CLI.new
t.run
p t.process_input
