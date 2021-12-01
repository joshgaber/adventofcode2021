module Day1
  class Main
    def initialize(input)
      @depths = input.strip.split(/\n/).map(&:to_i)
    end

    def part1
      (1...@depths.length).count { |i| @depths[i] > @depths[i - 1] }
    end

    def part2
      (3...@depths.length).count { |i| @depths[(i - 2)..i].sum > @depths[(i - 3)..(i - 1)].sum }
    end
  end
end
