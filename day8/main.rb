require_relative 'display'

module Day8
  class Main
    def initialize(input)
      @displays = input.split(/\n/).map { |display| Display.new(display) }
    end

    def part1
      @displays.sum(&:unique_number_count)
    end

    def part2
      @displays.sum(&:output_value)
    end
  end
end
