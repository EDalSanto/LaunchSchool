# compute first 60 last fibs and story in array
# nth last digit just nth % 60

def fibonacci_last(nth) 
  first_60 = [0, 1]

  3.upto(60) do 
    first_60 << (first_60[-2] + first_60.last) % 10
  end

  first_60[nth % 60]
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4
