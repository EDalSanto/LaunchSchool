def negative(n)
  n > 0 ? -n : n 
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0
