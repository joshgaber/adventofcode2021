require_relative 'vent'

module Day5
  class Main
    def initialize(input)
      @lines = input.split(/\n/).map { |line| Vent.new(line) }
    end

    def part1
      find_hot_zones(@lines.reject(&:diagonal?))
    end

    def part2
      find_hot_zones(@lines)
    end

    def find_hot_zones(lines)
      board = Array.new(lines.map(&:max_y).max + 1) { Array.new(lines.map(&:max_x).max + 1, 0) }

      lines.each do |line|
        line.points.each do |point|
          board[point[1]][point[0]] += 1
        end
      end

      board.flatten.count { |node| node > 1 }
    end
  end
end
