class Series
 
  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(n)
    raise ArgumentError if n > @string_of_digits.size

    @string_of_digits.chars.each_cons(n).map do |slice|
      slice.map(&:to_i)
    end
  end
end
