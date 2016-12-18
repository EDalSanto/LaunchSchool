DIGITS = '0123456789abcdef' 

def string_to_integer(str)
  sum = 0
  str.chars.each do |c| 
    digit = c.ord - '0'.ord 
    sum = sum * 10 + digit
  end
  sum
end

def hexadecimal_to_integer(hex)

  sum = 0
  hex.chars.each do |c| 
    digit = DIGITS.index(c.downcase)
    sum = sum * 16 + digit
  end
  sum

end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts hexadecimal_to_integer('4D9f') == 19871
