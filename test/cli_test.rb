require 'minitest/autorun'
require 'minitest/pride'
require './lib/cli'

class CLITest < Minitest::Test
  attr_reader :cli

  def setup
    @cli = CLI.new
  end

  def test_it_loads_a_data_file
    assert cli.container.empty?
    cli.load('./test_attendees.csv')
    refute cli.container.empty?
  end

  def test_it_finds_multiple_records_by_first_name
    cli.load('./test_attendees.csv')
    shannons = cli.find_by_first_name('Shannon')
    assert_equal 2, shannons.count
    shannons.each do |shannon|
      assert_equal "Shannon", shannon.first_name
    end
  end
end

# load event_attendees.csv
# queue count should return 0
# find first_name John
# queue count should return 63
# queue clear
# queue count should return 0
# help should list the commands
# help queue count should explain the queue count function
# help queue print should explain the printing function
