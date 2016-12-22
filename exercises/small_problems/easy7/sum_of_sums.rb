def sum_of_sums(arr)
  sum = 0
  arr.each_index do |i|
    sum += arr[0..i].inject(:+)
  end
  sum
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # ->
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
