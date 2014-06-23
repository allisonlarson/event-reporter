class CLI
  attr_reader :container, :list

  def initialize
    @container = []
    @list = List.new
  end

  def load(filename)
    @container = Container.load(filename)
    @list.container = @container
  end

  def find_by_first_name(name)
    list.find(:first_name, name)
  end
end
