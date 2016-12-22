def penultimate(str)
  str.split[-2] 
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

