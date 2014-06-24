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

  def length
    list.length
  end

  def each(&block)
    list.each(&block)
  end

  def clear
    list.clear
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
    binding.pry
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
<<<<<<< HEAD



=======
>>>>>>> e518ef8cf033a794e99909f7b3db131cbded0e7f
end

n = CLI.new
n.run
