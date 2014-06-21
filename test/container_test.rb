require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/container'
require './lib/entry'
require 'pry'
class ContainerTest<Minitest::Test


  def entries
    [
      {name: 'Tom Smith', homephone: '111-111-1111', zipcode: '21111'},
      {name: 'Alice Jones', homephone: '123-456-7890', zipcode: '1111'},
      {name: 'Zachary Evans', homephone: '(098) 765 4321', zipcode: '023'}
    ].map {|row| Entry.new(row)}
  end

  def repository
    @repository ||= Container.new(entries)
  end

  def test_it_finds_by_attribute
    entries = repository.find(:zipcode, '21111')
    assert_equal 1, entries.length
    e1, e2 = entries
    assert_equal 'Tom Smith', e1.name
    assert_equal '(111) 111-1111', e1.homephone
  end

end
