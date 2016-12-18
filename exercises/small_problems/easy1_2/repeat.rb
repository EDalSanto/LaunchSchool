# original C way
#def repeat(str, times)
#  print "#{str}\n" * times
#end

# Ruby Way
def repeat(str, num)
  num.times { puts str }
end

# tests
repeat('Hello', 3)
