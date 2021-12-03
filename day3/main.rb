require_relative 'array'

module Day3
  class Main
    def initialize(input)
      @report = input.split(/\n/)
    end

    def part1
      gamma = @report.map(&:chars).transpose.map(&:mode)
      epsilon = @report.map(&:chars).transpose.map(&:antimode)
      gamma.join.to_i(2) * epsilon.join.to_i(2)
    end

    def part2
      oxygen = find_best_stat(method: :mode)
      co2 = find_best_stat(method: :antimode)

      oxygen.to_i(2) * co2.to_i(2)
    end

    private

    def find_best_stat(method:)
      (0...@report.first.length).reduce(@report) do |acc, index|
        mode = acc.map { |elem| elem[index] }.public_send(method)
        list = acc.filter { |stat| stat[index] == mode }
        return list.first if list.length == 1

        list
      end
    end
  end
end
