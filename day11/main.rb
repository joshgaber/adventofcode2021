require_relative 'octopus'

module Day11
  class Main
    ADJACENT = ([-1, 0, 1].repeated_permutation(2).to_a - [[0, 0]]).freeze

    def initialize(input)
      @octopi = input.split(/\n/).map { |row| row.chars.map { |octopus| Octopus.new(octopus.to_i) } }
      @octopi.each.with_index do |row, y|
        row.each.with_index do |octopus, x|
          adjacent = ADJACENT.map { |adj| [y + adj[0], x + adj[1]] }
                             .filter { |adj| (0...@octopi.size).include?(adj[0]) && (0...@octopi.first.size).include?(adj[1]) }
                             .map { |adj| @octopi.dig(*adj) }
          octopus.add_adjacent(*adjacent)
        end
      end

      @octopi.flatten!(1)
    end

    def part1
      @octopi.each(&:initialize_level)

      100.times.sum do
        @octopi.each(&:reset_illumination).each(&:illuminate)
        @octopi.count(&:flashing?)
      end
    end

    def part2
      @octopi.each(&:initialize_level)

      steps = 0
      until @octopi.all?(&:flashing?)
        @octopi.each(&:reset_illumination).each(&:illuminate)
        steps += 1
      end

      steps
    end
  end
end
