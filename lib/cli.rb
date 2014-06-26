require_relative 'list'
require_relative 'container'
require 'pry'
require_relative "output_to_user"


class CLI
  attr_reader :list, :command, :container, :instruction, :sub_instruction, :criteria

  def initialize
    @container       = []
    @list            = List.new
    @command         = ''
    @instruction     = ''
    @sub_instruction = ''
    @criteria        = ''
  end

  def run
    OutputToUser.welcome
    OutputToUser.prompt
    input = gets.strip
    until input == 'quit'
      @command = process_input(input)
      assign_input_to_instructions
      first_instructions
      OutputToUser.prompt
      input = gets.strip
    end
    OutputToUser.quit
  end

  def process_input(input)
    input.split
  end

  def assign_input_to_instructions
    @instruction = command[0]
    @sub_instruction = command[1]
    @criteria = command[2..-1]
  end

  def first_instructions
    case instruction
      when 'load'  then load_parse
      when 'find'  then find
      when 'queue' then queue
      when 'help'  then help
    end
  end

  def load_parse
    if sub_instruction != nil
      load(sub_instruction)
    else
      load
    end
 end

  def load(filename = './event_attendees.csv')
    @filename = filename
    OutputToUser.loaded(@filename)
    @container = Container.load(@filename)
  end

  def find
    if !container.empty?
      clear
      case sub_instruction
        when 'first_name' then add(container.find_by_first_name(criteria.join))
        when 'last_name'  then add(container.find_by_last_name(criteria.join))
        when 'state'      then add(container.find_by_state(criteria.join))
        when 'zipcode'    then add(container.find_by_zipcode(criteria.join))
        when 'city'       then add(container.find_by_city(criteria.join(' ')))
      end
      OutputToUser.find
    end
  end

  def queue
    assign_queue_instruction
    case @queue_instruction
      when 'count'    then length
      when 'clear'    then clear
      when 'print'    then prints
      when 'print by' then print_by(@attribute)
      when 'save to'  then save(@attribute)
    end
  end

  def assign_queue_instruction
    if criteria[0] == 'by' or criteria[0] == "to"
      @queue_instruction = command[1..2].join(' ')
      @attribute = criteria[1]
    else
      @queue_instruction = sub_instruction
    end
  end

  def help
    if sub_instruction != nil
      case sub_instruction
        when 'load' then OutputToUser.help_load
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
    help = criteria.join
    case help
    when 'clear' then OutputToUser.help_queue_clear
    when 'count' then OutputToUser.help_queue_count
    when 'print' then OutputToUser.help_queue_print
    when 'save'  then OutputToUser.help_queue_save
    end
  end

  def prints
    list.prints
  end

  def save(attribute)
    list.save(attribute)
  end

  def print_by(attribute)
    list.filter_by(attribute)
    prints
  end

  def length
    number = list.length
    OutputToUser.count(number)
    number
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

end
