def reduce(array, default = 0)
  counter = 0
  sum = default 

  while counter < array.size do
    current_element = array[counter]
    sum = yield(sum, current_element) 
    counter += 1
  end

  sum
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num } 
p reduce(array, 10) { |acc, num| acc + num }
p reduce(array) { |acc, num| acc + num if num.odd? }
