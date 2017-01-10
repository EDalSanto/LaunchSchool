require_relative 'rotate_array'

def rotate_rightmost_digits(number, n)
  not_rotate = number.to_s[0...number.to_s.size - n]
  to_rotate = number.to_s[-n..-1]
  res = not_rotate + rotate_str(to_rotate) 
  res.to_i
end

if __FILE__ == $0
  puts rotate_rightmost_digits(735291, 1) == 735291
  puts rotate_rightmost_digits(735291, 2) == 735219
  puts rotate_rightmost_digits(735291, 3) == 735912
  puts rotate_rightmost_digits(735291, 4) == 732915
  puts rotate_rightmost_digits(735291, 5) == 752913
  puts rotate_rightmost_digits(735291, 6) == 352917
end
