require_relative 'card'

module Day4
  class Main
    def initialize(input)
      inputs = input.split(/\n\n/)
      @draws = inputs.shift.split(/,/).map(&:to_i)
      @cards = inputs.map { |card| Card.new(card) }
    end

    def part1
      reset

      @draws.each do |draw|
        @cards.each do |card|
          card.check_nodes(draw)
          return card.sum_unchecked * draw if card.complete?
        end
      end
    end

    def part2
      reset

      @draws.each do |draw|
        completed = []
        @cards.each do |card|
          card.check_nodes(draw)
          completed << card if card.complete?
        end

        @cards -= completed
        return completed.last.sum_unchecked * draw if @cards.length.zero?
      end
    end

    def reset
      @cards.each(&:reset)
    end
  end
end
