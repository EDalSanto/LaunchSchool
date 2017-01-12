def merge(arr1, arr2)
  merged_arr = []

  # While either array is not empty, find min of two, and add to merged 
  while !arr1.empty? && !arr2.empty?
    if arr1.min < arr2.min
      to_add = arr1.min
      arr1.shift
    else
      to_add = arr2.min
      arr2.shift
    end
    merged_arr << to_add
  end

  # if one of the arrays is not empty, add it to rest of merged
  if arr1.empty? && !arr2.empty?
    merged_arr = merged_arr + arr2
  elsif !arr1.empty? && arr2.empty?
    merged_arr = merged_arr + arr1
  end

  merged_arr

end

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]
