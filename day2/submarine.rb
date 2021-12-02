module Day2
  class Submarine
    def initialize
      @xpos = 0
      @ypos = 0
    end

    def move(direction, steps)
      case direction.to_sym
      when :forward
        @xpos += steps
      when :up
        @ypos -= steps
      when :down
        @ypos += steps
      else
        raise ArgumentError, "Invalid direction value: #{direction}"
      end
    end

    def position
      @xpos.abs * @ypos.abs
    end
  end

  class SubmarineWithAim < Submarine
    def initialize
      super
      @aim = 0
    end

    def move(direction, steps)
      case direction.to_sym
      when :forward
        @xpos += steps
        @ypos += (@aim * steps)
      when :up
        @aim -= steps
      when :down
        @aim += steps
      else
        raise ArgumentError, "Invalid direction value: #{direction}"
      end
    end
  end
end
