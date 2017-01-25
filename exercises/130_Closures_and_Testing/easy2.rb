#def step(start_value, end_value, step)
#  current = start_value
#  while current <= end_value
#    yield(current)
#    current += step
#  end
#  current
#end
#
#step(1, 10, 3) { |value| puts "value = #{value}" }
#

#def zip(array1, array2)
#  zipped_arr = []
#  array1.size.times { |i| zipped_arr << [array1[i], array2[i]] }
#  zipped_arr
#end
#
#puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
#

#def map(arr)
#  mapped_arr = []
#  arr.each { |el| mapped_arr << yield(el) }
#  mapped_arr
#end
#
#puts map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
#puts map([]) { |value| true } == []
#puts map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
#puts map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
#puts map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
#

#def drop_while(arr)
#  index = 0
#  while index < arr.size && yield(arr[index])
#    index += 1
#  end
#  
#  arr[index..-1]
#end
#
#
#puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
#puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
#puts drop_while([1, 3, 5, 6]) { |value| true } == []
#puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
#puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
#puts drop_while([]) { |value| true } == []
#

#def each_with_index(arr)
#  index = 0
#  while index < arr.size
#    yield(arr[index], index)
#    index += 1 
#  end
#  arr
#end
#
#result = each_with_index([1, 3, 6]) do |value, index|
#  puts "#{index} -> #{value**index}"
#end
#
#puts result == [1, 3, 6]

#def each_with_object(arr, object)
#  arr.each do |el|
#    yield(el, object)
#  end
#  object
#end
#
#result = each_with_object([1, 3, 5], []) do |value, list|
#  list << value**2
#end
#puts result == [1, 9, 25]
#
#result = each_with_object([1, 3, 5], []) do |value, list|
#  list << (1..value).to_a
#end
#puts result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
#
#result = each_with_object([1, 3, 5], {}) do |value, hash|
#  hash[value] = value**2
#end
#puts result == { 1 => 1, 3 => 9, 5 => 25 }
#
#result = each_with_object([], {}) do |value, hash|
#  hash[value] = value * 2
#end
#puts result == {}

#def max_by(arr)
#  largest = arr.first
#  arr.each do |el|
#    largest = el if yield(el) > yield(largest)
#  end
#  largest
#end
#
#puts max_by([1, 5, 3]) { |value| value + 2 } == 5
#puts max_by([1, 5, 3]) { |value| 9 - value } == 1
#puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
#puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
#puts max_by([-7]) { |value| value * 3 } == -7
#puts max_by([]) { |value| value + 5 } == nil

#def each_cons(arr, num_elements)
#  arr.each_with_index do |el, index|
#    break if index + num_elements > arr.size
#    yield(*arr[index...(index + num_elements)])
#  end
#  nil
#end
#
#hash = {}
#each_cons([1, 3, 6, 10], 1) do |value|
#  hash[value] = true
#end
#puts hash == { 1 => true, 3 => true, 6 => true, 10 => true }
#
#hash = {}
#each_cons([1, 3, 6, 10], 2) do |value1, value2|
#  hash[value1] = value2
#end
#puts hash == { 1 => 3, 3 => 6, 6 => 10 }
#
#hash = {}
#each_cons([1, 3, 6, 10], 3) do |value1, *values|
#  hash[value1] = values
#end
#puts hash == { 1 => [3, 6], 3 => [6, 10] }
#
#hash = {}
#each_cons([1, 3, 6, 10], 4) do |value1, *values|
#  hash[value1] = values
#end
#puts hash == { 1 => [3, 6, 10] }
#
#hash = {}
#each_cons([1, 3, 6, 10], 5) do |value1, *values|
#  hash[value1] = values
#end
#puts hash == {}
