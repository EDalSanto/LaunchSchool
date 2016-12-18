# puts 10 * (num / 2)
#

def stringy(num, first=1)
  new_str = ''
  (1..num).each do |n|
    if n % 2 == 0
      new_str += '0'  
    else
      new_str += '1'
    end
  end
  new_str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
