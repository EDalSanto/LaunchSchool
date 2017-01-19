def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

arr = [1, 2, 3, 4]
puts "arr: #{arr}" 
rolling_buffer1(arr, 4, 5)
puts "arr + 5 1: #{arr}"
rolling_buffer2(arr, 4, 6)
puts "arr + 5 2: #{arr}"
rolling_buffer1(arr, 5, 7)
puts "arr + 6 1: #{arr}"
rolling_buffer2(arr, 5, 8)
puts "arr + 6 2: #{arr}"

# rolling buffer1 uses the shovel operator which mutates the caller, whereas
# rolling buffer 2 does not mutate the caller and returns the original buffer
