# need to switch a and b for each iteration
# first gets updated to sum of two, second becomes previous value of a 

def fibonacci(nth)
  first, last = [1,1]

  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

if __FILE__ == $0
  puts fibonacci(1) == 1
  puts fibonacci(2) == 1
  puts fibonacci(3) == 2
  puts fibonacci(4) == 3
  puts fibonacci(5) == 5
  puts fibonacci(12) == 144
  puts fibonacci(20) == 6765
  puts fibonacci(100) == 354224848179261915075
  #puts fibonacci(100_001) # => 4202692702.....8285979669707537501
end
