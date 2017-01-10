def is_featured?(n)
  digits = n.to_s.chars
  n.odd? && n % 7 == 0 && digits.none? { |digit| digits.count(digit) > 1 }
end

def featured(n)
  while n.to_s.size < 11
    n += 1
    return n if is_featured?(n)
  end
  puts "There is no possible number"
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029 
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999) 
