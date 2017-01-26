# Octal string => decimal
class Octal
  def initialize(octal_string)
    @octal_chars = octal_string.chars
  end

  def to_decimal
    return 0 unless all_valid_octal_digits

    calculate_decimal
  end

  def all_valid_octal_digits
    @octal_chars.all? { |char| char =~ /[01234567]/ }
  end

  def current_power(index)
    @octal_chars.size - index - 1
  end

  def calculate_decimal
    res = 0
    @octal_chars.each_with_index do |octdigit, index|
      res += (8**current_power(index)) * octdigit.to_i
    end
    res
  end
end
