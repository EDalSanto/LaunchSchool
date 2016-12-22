def show_multiplicative_average(arr)
  res = arr.reduce(:*) / arr.size.to_f 
  format("The result is %.3f", res)
end

puts show_multiplicative_average([3, 5])

puts show_multiplicative_average([2, 5, 7, 11, 13, 17])
