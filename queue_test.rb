require 'minitest/autorun'
require 'minitest/pride'

class QueueTest< Minitest::Test
  def test_it_exsists
    queue = Queue.new
  end
end
