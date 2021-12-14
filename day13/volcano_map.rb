module Day13
  class VolcanoMap
    def initialize(dots)
      @dots = dots.map { |dot| dot.map(&:to_i) }
    end

    def fold(axis, magnitude)
      folded_dots = @dots.map do |dot|
        if axis == :x
          [(dot[0] - magnitude).abs - 1, dot[1]]
        else
          [dot[0], (dot[1] - magnitude).abs - 1]
        end
      end

      self.class.new(folded_dots.uniq)
    end

    def count
      @count ||= @dots.count
    end

    def printable
      @printable ||= Array.new(@dots.map { |dot| dot[1] }.max + 1) do |y|
        Array.new(@dots.map { |dot| dot[0] }.max + 1) { |x| @dots.include?([x, y]) ? "\u2588" : ' ' }.reverse.join
      end.reverse.join("\n")
    end
  end
end
