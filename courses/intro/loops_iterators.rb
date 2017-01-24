# What does the each method in the following program return after it is finished executing?
#
# x = [1, 2, 3, 4, 5]
# x.each do |a|
#   a + 1
# end
# => [1, 2, 3, 4, 5]
#
# Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.
#
# user_input = ''
# while user_input != "STOP"
#   puts "Would you to STOP or learn more about me?"
#   user_input = gets.chomp
# end

# Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

# countries = ["Germany","Italy","Japan","USA","China"]
# countries.each_with_index do |country,index|
#   puts "#{index+1}. #{country}"
# end

# Write a method that counts down to zero using recursion.
# def countdown_recur(num)
#   if num == 0
#     puts "Done!"
#   else
#     puts num
#     countdown_recur(num-1)
#   end
# end

countdown_recur(10)
