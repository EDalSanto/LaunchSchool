DIGITS = "0123456789abcdef"

def integer_to_string(n)
  return '0' if n == 0 
  res = ''
  while n > 0
    n, rem = n.divmod(10)
    res.prepend(DIGITS[rem])
  end
  res
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
