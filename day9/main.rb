module Day9
  class Main
    OFFSETS = [[-1, 0], [1, 0], [0, -1], [0, 1]].freeze
    def initialize(input)
      @map = input.split(/\n/).map { |row| row.chars.map(&:to_i) }
    end

    def part1
      low_points = 0
      @map.each.with_index do |row, y|
        row.each.with_index do |height, x|
          adjacent = OFFSETS.map { |offset| [offset[0] + y, offset[1] + x] }
                            .filter { |offset| (0...@map.size).include?(offset[0]) && (0...@map.first.size).include?(offset[1]) }

          low_points += (height + 1) if adjacent.all? { |offset| @map.dig(*offset) > height }
        end
      end

      low_points
    end

    def part2
      basin_map = @map.map { |row| row.map { |height| height == 9 ? ' ' : 'X' } }
      basins = basin_map.map.with_index do |row, y|
        (0...row.size).map do |x|
          check_for_basin(basin_map, y, x)
        end
      end

      basins.flatten(1).map(&:size).max(3).reduce(:*)
    end

    private

    def check_for_basin(basin_map, y, x)
      return [] if y.negative? || x.negative? || !basin_map[y] || basin_map[y][x] != 'X'

      basin_map[y][x] = ' '

      [
        [y, x],
        *OFFSETS.map { |offset| check_for_basin(basin_map, y + offset[0], x + offset[1]) }.flatten(1)
      ]
    end
  end
end
