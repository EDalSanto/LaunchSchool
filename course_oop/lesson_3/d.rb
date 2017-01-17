arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map do |char|
  char.upcase!
end

p arr1 # => ["a", "b", "c"]
p arr2 # => ["A", "B", "C"]
