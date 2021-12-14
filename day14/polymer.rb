module Day14
  class Polymer
    def initialize(template)
      @template = template
    end

    def refactor(rules)
      string = @template.chars[1..].each.with_index.reduce(@template[0]) do |acc, (elem, index)|
        acc + rules[@template[index, 2]].to_s + elem
      end

      self.class.new(string)
    end

    def to_s
      @template
    end
  end
end
