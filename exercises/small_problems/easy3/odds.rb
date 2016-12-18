def oddities(arr)
  odds = []
  arr.each_with_index { |e, i| odds << e if i.even? } 
  odds
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
