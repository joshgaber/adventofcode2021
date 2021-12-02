require_relative 'submarine'

module Day2
  class Main
    def initialize(input)
      @directions = input.strip.split(/\n/).map do |step|
        step.split(/\s/).then { |dir| [dir[0].to_sym, dir[1].to_i] }
      end
    end

    def part1
      sub = Submarine.new
      @directions.each { |dir| sub.move(*dir) }
      sub.position
    end

    def part2
      sub = SubmarineWithAim.new
      @directions.each { |dir| sub.move(*dir) }
      sub.position
    end
  end
end
