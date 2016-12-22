def reverse!(arr)
  left_index = 0
  right_index = -1

  while left_index < arr.size / 2
    arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
    left_index += 1
    right_index -= 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id
 
list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
puts list == ["e", "d", "c", "b", "a"]
 
list = ['abc']
reverse!(list) # => ["abc"]
puts list == ["abc"]
 
list = []
reverse!([]) # => []
puts list == []
