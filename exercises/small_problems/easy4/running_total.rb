#array of nums, returns array of same number elements with running total from
#oroginal array
# final number in return array is the sum of entire array
# new number in array is sum up to that index in original array

#def running_total(arr)
#  new_arr = []
#  running_total = 0
#  arr.each do |n|
#    running_total += n
#    new_arr << running_total 
#  end
#  new_arr
#end

def running_total(arr)
  sum = 0
  arr.map { |value| sum += value }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
