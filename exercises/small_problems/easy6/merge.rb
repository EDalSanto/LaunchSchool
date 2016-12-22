def merge(arr1, arr2)
  new_arr = arr1.uniq 

  arr2.each do |el| 
    new_arr << el if !new_arr.include?(el)  
  end

  new_arr
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
