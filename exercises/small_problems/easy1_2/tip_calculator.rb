if __FILE__ == $0
  print "What is the bill? "
  bill = gets.chomp.to_i
  print "What is the tip percentage? "
  tip_percentage = gets.chomp.to_f / 100 

  tip = bill * tip_percentage
  total = bill + tip
  puts "The tip is $#{tip}"
  puts "The total is $#{total}"
end
