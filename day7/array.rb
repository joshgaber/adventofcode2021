class Array
  def median
    return if length.zero?

    if length.odd?
      sort[length / 2]
    else
      sort[length / 2 - 1, 2].mean
    end
  end

  def mean
    sum / length
  end
end
