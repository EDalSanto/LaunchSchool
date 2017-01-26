class Trinary
  TRINARY_DIGIT = /[0123]/
  BASE = 3

  def initialize(trinary_string)
    @trinary_chars = trinary_string.chars
  end

  def to_decimal
    return 0 unless all_valid_trinary_digits

    convert_number
  end

  def all_valid_trinary_digits
    @trinary_chars.all? { |char| char =~ TRINARY_DIGIT }
  end

  def current_power(index)
    @trinary_chars.size - index - 1
  end

  def convert_number
    res = 0
    @trinary_chars.each_with_index do |tridigit, index|
      res += convert_digit(index, tridigit)
    end
    res
  end

  def convert_digit(index, tridigit)
    (BASE**current_power(index)) * tridigit.to_i
  end
end
