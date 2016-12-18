if __FILE__ == $0
  print "What is your age? " 
  current_age = gets.chomp.to_i
  print "At what age would you like to retire? "
  retire_age = gets.chomp.to_i
  retire_year = Time.now.year + retire_age - current_age 
  years_left = retire_year - Time.now.year 

  puts "It's #{Time.now.year}. You will retire in #{retire_year}."
  puts "You have only #{years_left} years of work to go!"
end
