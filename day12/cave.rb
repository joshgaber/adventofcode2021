module Day12
  class Cave
    def initialize(name)
      @name = name.to_sym
      @paths = []
    end

    def <<(cave)
      @paths << cave
    end

    def paths_to_end(travelled: [], small_cave_visits: 1)
      return [travelled + [self]] if end?
      return if start? && travelled.include?(self)

      small_cave_count = travelled.filter(&:small?).uniq.map { |t| travelled.count(t) }.max
      return if small? && travelled.include?(self) && small_cave_count >= small_cave_visits

      @paths.map { |path| path.paths_to_end(travelled: travelled + [self], small_cave_visits: small_cave_visits) }
            .compact
            .flatten(1)
    end

    def small?
      @small ||= @name.to_s == @name.to_s.downcase
    end

    def start?
      @start ||= @name == :start
    end

    def end?
      @end ||= @name == :end
    end
  end
end
