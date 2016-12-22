$cache = [0,1]

def fib(n)  
  return $cache[n] if $cache[n] 

  $cache[n] = fib(n - 1) + fib(n - 2)
end

def find_fib_index_by_len(digits)
  n = 0 
  while (fib(n).to_s.size < digits)
    n += 1
  end
  n
end

puts find_fib_index_by_len(2) == 7
puts find_fib_index_by_len(10) == 45
puts find_fib_index_by_len(100) == 476
puts find_fib_index_by_len(1000) == 4782
puts find_fib_index_by_len(10000) == 47847
