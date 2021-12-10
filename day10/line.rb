module Day10
  class Line
    BRACKETS = {
      ')' => { open: '(', error: 3, complete: 1 },
      ']' => { open: '[', error: 57, complete: 2 },
      '}' => { open: '{', error: 1197, complete: 3 },
      '>' => { open: '<', error: 25_137, complete: 4 }
    }.freeze

    OPEN_BRACKETS = BRACKETS.to_h { |key, bracket| [bracket[:open], key] }.freeze

    attr_reader :error_score, :stack

    def initialize(line)
      @line = line.chars
      @error_score, @stack = processed
    end

    def completion_score
      return 0 unless @error_score.zero?

      closing_braces = @stack.reverse.map { |char| OPEN_BRACKETS[char] }
      closing_braces.map { |brace| BRACKETS[brace][:complete] }.reduce { |acc, elem| acc * 5 + elem }
    end

    private

    def processed
      bracket_stack = []

      @line.each do |char|
        case char
        when *OPEN_BRACKETS.keys
          bracket_stack << char
        when *BRACKETS.keys
          return [BRACKETS[char][:error], bracket_stack] unless bracket_stack.last == BRACKETS[char][:open]

          bracket_stack.pop
        end
      end

      [0, bracket_stack]
    end
  end
end
