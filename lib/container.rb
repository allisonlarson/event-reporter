require 'pry'
require 'csv'


class Container
  def self.load(file)
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.map do |row|
      Entry.new(row)
    end
    new(rows)
  end

  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def find(attribute, criteria)
    entries.select { |entry| entry.send(attribute) == criteria }
  end

  def empty?
    entries.empty?
  end
end
