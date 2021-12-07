require_relative 'array'

module Day7
  class Main
    def initialize(input)
      @positions = input.split(/,/).map(&:to_i)
    end

    def part1
      median = @positions.median
      @positions.sum { |position| (position - median).abs }
    end

    def part2
      mean = @positions.mean
      @positions.sum do |position|
        distance = (position - mean).abs
        distance * (distance + 1) / 2
      end
    end
  end
end
