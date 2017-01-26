# Octal string => decimal
class Octal
  BASE = 8
  OCTAL_DIGITS = /[01234567]/

  def initialize(octal_string)
    @octal_chars = octal_string.chars
  end

  def to_decimal
    return 0 unless all_valid_octal_digits

    convert_number
  end

  def all_valid_octal_digits
    @octal_chars.all? { |char| char =~ OCTAL_DIGITS }
  end

  def current_power(index)
    @octal_chars.size - index - 1
  end

  def convert_number
    res = 0
    @octal_chars.each_with_index do |octdigit, index|
      res += convert_digit(index, octdigit)
    end
    res
  end

  def convert_digit(index, octdigit)
    (8**current_power(index)) * octdigit.to_i
  end
end
