require_relative 'cave'

module Day12
  class Main
    def initialize(input)
      caves = {}
      input.split(/\n/).each do |path|
        caves = path.split(/-/).map { |cave| caves[cave] ||= Cave.new(cave) }
        caves[0] << caves[1]
        caves[1] << caves[0]
      end

      @start_cave = caves['start']
    end

    def part1
      @start_cave.paths_to_end.count
    end

    def part2
      @start_cave.paths_to_end(small_cave_visits: 2).count
    end
  end
end
