# sum of all multiples between 1 and n that are divisble by 3 and 5

def multisum(n)
  (1..n).to_a.select { |n| n % 3 == 0 || n % 5 == 0 }.reduce(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
