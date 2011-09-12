require 'test_helper'

class RollTest < ActiveSupport::TestCase

  test 'testing' do
    assert true
  end

  should 'have a result' do
    roll = EarthdawnRoller::Roll.new()
    assert_not_nil roll.result
  end

  should 'accept a step number on create' do
    roll = EarthdawnRoller::Roll.new(:step => 4)
    assert roll.step = 4
  end

  should 'roll the right dice for several step numbers' do
    roll = EarthdawnRoller::Roll.new(:step => 1)
    assert roll.dice.first.d == 6, 'sixer for step 1'
    assert roll.dice.first.modifier == 3, 'minus 3 for step 1'

    roll = EarthdawnRoller::Roll.new(:step => 4)
    assert roll.dice.first.d == 6, 'sixer for step 4'
    
    roll = EarthdawnRoller::Roll.new(:step => 5)
    assert roll.dice.first.d == 8, 'eight-sided for step 5'

    roll = EarthdawnRoller::Roll.new(:step => 8)
    assert roll.dice.map{|d| d.d} == [6,6], 'two sixes for step 8'
  end

end


