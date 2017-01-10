def sum_square_difference(n)
  square_sum = ((1..n).to_a.reduce(:+))**2
  sum_of_squares = (1..n).to_a.map { |n| n**2 }.reduce(:+)
  square_sum - sum_of_squares
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
