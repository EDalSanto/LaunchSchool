factorial = Enumerator.new do |yielder|
  n = 1
  loop do
    yielder << (1..n).inject(:*) 
    n += 1
  end
end


7.times { puts factorial.next }

factorial.rewind

factorial.each_with_index do |num, index|
  puts num
  break if index == 6 
end
