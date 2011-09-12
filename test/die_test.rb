require 'test_helper'

class DieTest < ActiveSupport::TestCase

  should 'roll a bonus die' do 
    EarthdawnRoller::Die.any_instance.stubs(:roll).returns(6, 4)
    die = EarthdawnRoller::Die.new(6)

    assert die.result == 10
  end
  
  should 'roll multiple bonus dice' do 
    EarthdawnRoller::Die.any_instance.stubs(:roll).returns(6, 6, 6, 4)
    die = EarthdawnRoller::Die.new(6)

    assert die.result == 22
  end

  should 'accept modifier' do
    EarthdawnRoller::Die.any_instance.stubs(:roll).returns(5)
    die = EarthdawnRoller::Die.new("6-3")
    assert die.modifier == 3
    assert die.result == 2
  end

  should 'not be less then 1' do
    EarthdawnRoller::Die.any_instance.stubs(:roll).returns(1)
    die = EarthdawnRoller::Die.new("6-3")
    assert die.modifier == 3
    assert die.result > 0
  end

  should 'roll bonus on modified die' do
    EarthdawnRoller::Die.any_instance.stubs(:roll).returns(6, 3)
    die = EarthdawnRoller::Die.new('6-3')

    assert die.result == 4

  end
end
