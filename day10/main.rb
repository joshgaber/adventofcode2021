require_relative 'line'

module Day10
  class Main
    def initialize(input)
      @lines = input.split(/\n/).map { |line| Line.new(line) }
    end

    def part1
      @lines.sum(&:error_score)
    end

    def part2
      @lines.map(&:completion_score).reject(&:zero?).median
    end
  end
end
