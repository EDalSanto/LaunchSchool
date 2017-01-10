require_relative 'rotate_rightmost_digits'

def max_rotation(num)  
  int_len = num.to_s.size

  (int_len - 1).times do |i|
    num = rotate_rightmost_digits(num, int_len - i)    
  end
  num
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
