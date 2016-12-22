def multiply_list(arr1, arr2)   
  arr1.zip(arr2).map { |arr| arr.reduce(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
