module Day6
  class Main
    def initialize(input)
      @fishes = input.split(/,/).map(&:to_i)

      @spawn_counts = 256.times.each_with_object(Hash.new(1)) do |i, counts|
        counts[i] += i.step(1, -7).sum { |j| counts[j - 9] }
      end
    end

    def part1
      @fishes.sum { |fish| @spawn_counts[80 - fish] }
    end

    def part2
      @fishes.sum { |fish| @spawn_counts[256 - fish] }
    end
  end
end
