def print_occurences(hash)
  hash.each { |k, v| puts "#{k} => #{v}" }
end

def count_occurences(arr)
  occurences = Hash.new(0) 
  arr.each do |e|
    occurences[e] += 1
  end
  print_occurences(occurences) 
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurences(vehicles)
