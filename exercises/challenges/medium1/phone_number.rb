# problem: clean up user-entered phone numbers
# handle constraints
# actions: num digits, checking first numbers
# special to_s, otherwise just digits
# 
# Clean number of puncuation
# clean number of excess digits if need be
# determine if bad/good
# respond appropriately

class PhoneNumber
  attr_accessor :number
  NON_NUMBER = /[^\d]/
  BAD_NUMBER = '0000000000'

  def initialize(original_number)
    @number = clean_number(original_number)
  end

  def remove_non_numbers(original_number)
    original_number.gsub(NON_NUMBER, '')
  end

  def clean_number(original_number)
    return BAD_NUMBER if original_number =~ /[a-zA-Z]/

    stripped_number = remove_non_numbers(original_number)
    if stripped_number.size < 10
      BAD_NUMBER
    elsif stripped_number.size == 10
      stripped_number
    elsif stripped_number.size == 11 && stripped_number[0] == '1'
      stripped_number.slice(1..-1)
    else
      BAD_NUMBER
    end
  end

  def area_code
    number.slice(0..2)
  end

  def to_s
    "(#{number.slice(0..2)}) " + "#{number.slice(3..5)}-" + number.slice(6..-1)
  end
end
