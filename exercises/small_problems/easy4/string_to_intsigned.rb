def string_to_signed_integer(str)
  sum = 0
  sign = (str[0] == '-') ? -1 : 1
  str.chars.reduce(0) do |a, c| 
    if c =~ /\d/
      digit = c.ord - '0'.ord 
      a * 10 + digit
    end
  end
  sum * sign
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
