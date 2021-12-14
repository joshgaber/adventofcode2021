require_relative 'volcano_map'

module Day13
  class Main
    def initialize(input)
      dots, folds = input.split(/\n\n/)
      @map = VolcanoMap.new(dots.split(/\n/).map { |dot| dot.split(/,/) })
      @folds = folds.split(/\n/).map { |fold| fold.match(/(x|y)=(\d+)/).then { |i| [i[1].to_sym, i[2].to_i] } }
    end

    def part1
      @map.fold(*@folds.first).count
    end

    def part2
      "\n#{@folds.reduce(@map) { |acc, fold| acc.fold(*fold) }.printable}"
    end
  end
end
