module Day11
  class Octopus
    def initialize(level)
      @initial_level = level
      initialize_level
      @adjacent = []
    end

    def add_adjacent(*args)
      @adjacent += args
    end

    def illuminate
      return if flashing?

      @level += 1
      @adjacent.each(&:illuminate) if flashing?
    end

    def reset_illumination
      @level %= 10
    end

    def initialize_level
      @level = @initial_level
    end

    def flashing?
      @level == 10
    end
  end
end
