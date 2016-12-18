def compute_sum(int)
  (1..int).to_a.reduce(:+)
end

def compute_product(int)
  (1..int).to_a.reduce(:*)
end

if __FILE__ == $0
  puts "Please enter an integer greater than 0:"
  int = gets.chomp.to_i
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp
  while operation != 's' && operation != 'p'
    puts "Sorry, please enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp
  end
  
  if operation == 's'
    puts "The sum of intergers between 1 and #{int} is #{compute_sum(int)}"
  else
    puts "The product of integers between 1 and #{int} is #{compute_product(int)}"
  end

end
