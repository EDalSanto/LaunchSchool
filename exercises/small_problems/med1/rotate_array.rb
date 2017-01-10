def rotate_array(arr)
  rotated_arr = arr[1..-1] + [arr[0]]
end

def rotate_str(str)
  rotate_array(str.chars).join
end

def rotate_int(int)
  rotate_str(int.to_s).to_i
end

if __FILE__ == $0
  puts rotate_str('hello') == 'elloh'
  
  puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  puts rotate_array(['a']) == ['a']
  
  x = [1, 2, 3, 4]
  puts rotate_array(x) == [2, 3, 4, 1]   # => true
  puts x == [1, 2, 3, 4] 

 end
