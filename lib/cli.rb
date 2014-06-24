require_relative 'list'
require_relative 'container'
require_relative "output_to_user"

class CLI
  attr_reader :container, :list, :command, :parameters

  def initialize
    @container  = []
    @list       = List.new
    @command    = ''
    @parameters = ''
  end

  def load(filename)
    @container = Container.load(filename)
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

  def process_input(input)
    input.downcase.split
  end

  def format_parameters(parameters)

  end

  def assign_instructions
    if process_input[0]

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

n = CLI.new
n.run
