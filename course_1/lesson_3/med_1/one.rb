str = "The Flintstones Rock!"
(0..9).to_a.each do |n|
  n.times { |_| print ' ' }
  puts str
end

#or
10.times { |number| puts (" " * number) + str }
