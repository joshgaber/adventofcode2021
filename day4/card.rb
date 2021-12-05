module Day4
  class Card
    def initialize(layout)
      @layout = layout.split(/\n/).map do |row|
        row.strip.split(/\s+/).map { |node| Node.new(node) }
      end
    end

    def check_nodes(value)
      each_node { |node| node.check_on_match(value) }
    end

    def complete?
      @layout.any? { |row| row.all?(&:checked) } || @layout.transpose.any? { |row| row.all?(&:checked) }
    end

    def sum_unchecked
      @layout.flatten.reject(&:checked).sum(&:value)
    end

    def reset
      each_node(&:reset)
    end

    private

    def each_node(&block)
      @layout.each { |row| row.map(&block) }
    end
  end

  class Node
    attr_reader :checked, :value

    def initialize(value)
      @value = value.to_i
      reset
    end

    def check_on_match(check_value)
      @checked = true if @value == check_value
    end

    def reset
      @checked = false
    end
  end
end
