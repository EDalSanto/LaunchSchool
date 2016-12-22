def halvsies(arr)
  elements_1 = (arr.size / 2.0).ceil 
  arr_1 = arr[0...elements_1] 
  arr_2 = arr[elements_1..-1]
  [arr_1, arr_2]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
