module Day5
  class Vent
    def initialize(line)
      @xstart, @ystart, @xend, @yend = line.split(/,|\s*->\s*/).map(&:to_i)
    end

    def points
      @points ||= begin
        xline = @xstart == @xend ? [@xstart] : @xstart.step(@xend, @xend <=> @xstart).to_a
        yline = @ystart == @yend ? [@ystart] : @ystart.step(@yend, @yend <=> @ystart).to_a
        length = [xline.length, yline.length].max

        length.times.map { |i| [xline[i] || xline.first, yline[i] || yline.first] }
      end
    end

    def max_x
      @max_x ||= [@xstart, @xend].max
    end

    def max_y
      @max_x ||= [@ystart, @yend].max
    end

    def diagonal?
      @diagonal ||= @xstart != @xend && @ystart != @yend
    end
  end
end
