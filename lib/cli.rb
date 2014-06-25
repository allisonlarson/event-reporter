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
    puts
    OutputToUser.prompt
    input = gets.strip
    until input == 'quit'
      @command = process_input(input)
      assigns_instructions
      OutputToUser.prompt
      input = gets.strip
    end
    OutputToUser.quit
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
    if container.empty? == false
      attribute = command[1]
      criteria = command[2..-1].join(' ')
      clear
      case attribute
      when 'first_name' then add(container.find_by_first_name(criteria))
      when 'last_name'  then add(container.find_by_last_name(criteria))
      when 'state'      then add(container.find_by_state(criteria))
      when 'zipcode'    then add(container.find_by_zipcode(criteria))
      when 'city'       then add(container.find_by_city(criteria))
      end
      OutputToUser.find
    end
  end

  def queue
    instruct = command[1]
    attribute = command[3]
      if command[2] == 'by'
        print_by(attribute)
      end
    case instruct
    when 'count'    then length
    when 'clear'    then clear
    when 'print'    then prints
    when 'save'     then save(attribute)
    end
  end

  def prints
    list.prints
  end

  def print_by(attribute)
    list.filter_by(attribute)
  end

  def load_parse
    if command.length > 1
      file = command[1]
      load(file)
    else
      load
    end
 end

  def load(filename = './event_attendees.csv')
    @filename = filename
    OutputToUser.loaded(@filename)
    @container = Container.load(@filename)
  end

  def length
    OutputToUser.count
    puts list.length
  end

  def each(&block)
    list.each(&block)
  end

  def clear
    OutputToUser.clear
    list.clear
  end

  def add(entry)
    list.adds_entrys(entry)
  end

  def save(attribute)
    list.save(attribute)
  end

  def help
    if command.length > 1
      input = command[1]
      case input
      when 'find'  then OutputToUser.help_find_by
      when 'queue' then help_queue
      when 'help'  then OutputToUser.help_command
      when 'quit'  then OutputToUser.help_quit
      end
    else
      OutputToUser.help
    end
  end

  def help_queue
    input_command = command[2]
    case input_command
    when 'clear' then OutputToUser.help_queue_clear
    when 'count' then OutputToUser.help_queue_count
    when 'print' then OutputToUser.help_queue_print
    when 'save'  then OutputToUser.help_queue_save
    end
  end
end


t = CLI.new
t.run
