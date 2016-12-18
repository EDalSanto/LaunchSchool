DIGITS = "0123456789abcdef"

def signed_integer_to_string(n)
  return '0' if n == 0 
  sign = (n < 0) ? '-' : '+' 
  n *= -1 if sign == '-'
  res = ''
  while n != 0
    n, rem = n.divmod(10)
    res.prepend(DIGITS[rem])
  end
  res.prepend(sign)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
