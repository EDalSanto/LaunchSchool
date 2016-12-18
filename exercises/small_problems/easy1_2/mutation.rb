array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |v| array2 << v }
array1.each { |v| v.upcase! if v.start_with?('C', 'S') }
puts array2
