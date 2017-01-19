def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts "Factors of 10: #{factors(10)}"
puts "Factors of 0: #{factors(0)}"
puts "Factors of -10: #{factors(-10)}"
