module Day8
  class Display
    def initialize(input)
      configurations, display = input.split(/\s*\|\s*/)
      @configurations = configurations.split(/\s/).map { |config| config.chars.sort }
      @display = display.split(/\s/).map { |display| display.chars.sort }
    end

    def unique_number_count
      @unique_number_count ||= @display.count { |digit| [2, 3, 4, 7].include?(digit.length) }
    end

    def output_value
      @output_value ||= @display.map { |digit| digit_map.key(digit) }.join.to_i
    end

    private

    def digit_map
      @digit_map ||= {}.tap do |digit_map|
        digit_map['1'] = @configurations.detect { |config| config.length == 2 }
        digit_map['7'] = @configurations.detect { |config| config.length == 3 }
        digit_map['4'] = @configurations.detect { |config| config.length == 4 }
        digit_map['8'] = @configurations.detect { |config| config.length == 7 }
        digit_map['9'] = @configurations.detect do |config|
          config.length == 6 && (digit_map['4'] - config).empty?
        end
        digit_map['0'] = @configurations.detect do |config|
          config.length == 6 && !(digit_map['4'] - config).empty? && (digit_map['1'] - config).empty?
        end
        digit_map['6'] = @configurations.detect do |config|
          config.length == 6 && !(digit_map['4'] - config).empty? && !(digit_map['1'] - config).empty?
        end
        digit_map['3'] = @configurations.detect do |config|
          config.length == 5 && (digit_map['7'] - config).empty?
        end
        digit_map['5'] = @configurations.detect do |config|
          config.length == 5 && !(digit_map['7'] - config).empty? && (config - digit_map['6']).empty?
        end
        digit_map['2'] = @configurations.detect do |config|
          config.length == 5 && !(digit_map['7'] - config).empty? && !(config - digit_map['6']).empty?
        end
      end
    end
  end
end
