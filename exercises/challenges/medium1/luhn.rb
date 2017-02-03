# Luhn is a checksum formula..verifies a number against its included check digit
# Test
#   -count from rightmost digit, move left, and double the value of every second
#   digit
#   -subtract 9 from the result for any digits that become 10 or more
#   -add all these new digits together
#   -if total(the checksum) ends in (mod 10 is congruent to 0)
#
# Input: any valid number
# Functionality: 
#   - whether or not the number is valid for the Luhn formula
#   - return value and remainder of Luhn method 
#   - add a check digit to make the number valid and return the orignal number
#   plus that digit 
#     - i.e., give "2323 2005 7766 3554" in response to "2323 2005 7766 355" 
#
#
class Luhn
  attr_accessor :original_num

  def initialize(original_num)
    @original_num = original_num
  end

  # Enables starting with right most digit
  def reverse_num_array
    original_num.to_s.chars.map(&:to_i).reverse
  end

  def addends
    reversed_addends = reverse_num_array.each_with_index.map do |num, index|
      if index.odd?
        transform(num)
      else
        num
      end
    end
    reversed_addends.reverse
  end

  def transform(num)
    transformed = num * 2
    transformed -= 9 if transformed >= 10
    transformed
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(invalid_number)
    new_base_number = invalid_number * 10
    if new(new_base_number).valid?
      new_base_number
    else
      remainder = new(new_base_number).checksum % 10
      new_base_number + (10 - remainder)
    end
  end

end
