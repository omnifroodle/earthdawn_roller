require 'rubygems'
require 'active_model'


module EarthdawnRoller
  class Roll
    include ActiveModel::AttributeMethods
    STEPS = {
      1 => ['6-3'],
      2 => ['6-2'],
      3 => ['6-1'],
      4 => [6],
      5 => [8],
      6 => [10],
      7 => [12],
      8 => [6, 6],
      9 => [8, 6],
      10 => [8, 8],
      11 => [10, 8],
      12 => [10, 10],
      13 => [12, 10],
      14 => [12, 12],
      15 => [12, 6, 6],
      16 => [12, 8, 6],
      17 => [12, 8, 8],
      18 => [12, 10, 8],
      19 => [12, 10, 10],
      20 => [12, 12, 10],
      21 => [12, 12, 12],
      22 => [12, 12, 6, 6],
      23 => [12, 12, 8, 6],
      24 => [12, 12, 8, 8],
      25 => [12, 12, 10, 8],
      26 => [12, 12, 10, 10],
      27 => [12, 12, 12, 10],
      28 => [12, 12, 12, 12]

    }
    attr_accessor :result, :step, :dice

    def initialize(options = {})
      @step = options[:step] || 4
      @dice = STEPS[@step].map{|d| Die.new(d)}
      @result = @dice.inject(0){|sum, n| sum + n.result}
    end

    def to_s

      @result.to_s
    end
    class << self
      def step(num)
        Roll.new(:step => num)
      end
    end
  end

  class Die
    attr_reader :d, :face, :bonus, :modifier

    def initialize(d)
      parse_d(d)
      @face = roll
      if @d == @face
        @bonus = Die.new(d)
      end
    end

    def result
      bonus = @bonus.nil? ? 0 : @bonus.result
      total = @face - @modifier
      total = 1 if total < 1
      total + bonus
    end

    private 

    def parse_d(d)
      case d
      when String
        @d, @modifier = d.split('-').map{|i| i.to_i}
      else
        @d = d
        @modifier = 0
      end
    end

    def roll
      1 + rand(d)
    end

  end
end
