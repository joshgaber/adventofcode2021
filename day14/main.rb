require_relative 'polymer'

module Day14
  class Main
    def initialize(input)
      template, rules = input.split(/\n\n/)
      @polymer = Polymer.new(template)
      @rules = rules.split(/\n/).to_h { |rule| rule.split(/\s*->\s*/) }
    end

    def part1
      template = 10.times.reduce(@polymer) { |acc, _| acc.refactor(@rules) }.to_s

      char_counts = template.chars.each.with_object(Hash.new(0)) { |char, acc| acc[char] += 1 }
      char_counts.values.max - char_counts.values.min
    end

    def part2
      template = 40.times.reduce(@polymer) { |acc, _| acc.refactor(@rules) }.to_s

      char_counts = template.chars.each.with_object(Hash.new(0)) { |char, acc| acc[char] += 1 }
      char_counts.values.max - char_counts.values.min
    end
  end
end
