class Array
  def mode
    count_hash = char_counts

    return '1' if count_hash['0'] == count_hash['1']

    count_hash.key(count_hash.values.max)
  end

  def antimode
    count_hash = char_counts

    return '0' if count_hash['0'] == count_hash['1']

    count_hash.key(count_hash.values.min)
  end

  private

  def char_counts
    each_with_object(Hash.new(0)) { |elem, acc| acc[elem] += 1 }
  end
end
