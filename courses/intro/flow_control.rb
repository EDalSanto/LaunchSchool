# Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.
#
# 1. (32 * 4) >= 129 # false
# 2. false != !true # false
# 3. true == 4 # false (although 4 would evaluate to true in a conditional, it is not equate to true)
# 4. false == (847 == '874') # true
# 5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false # true

# Write a method that takes a string as argument. The method should return the all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)

# def upcase_plus_10(string)
#   if string.length > 10
#     string.upcase
#   else
#     string
#   end
# end
#
# p upcase_plus_10('hello') == 'hello'
# p upcase_plus_10('hello there world!') == 'HELLO THERE WORLD!'

# # Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.
#
# puts "Please give me a number between 0 and 100"
# number = gets.chomp.to_i
# if number < 0
#   puts "Your can't enter a negative number!"
# elsif number <= 50
#   puts "#{number} is between 0 and 50"
# elsif number <= 100
#   puts "#{number} is between 51 and 100"
# else
#   puts "#{number} is above 100!"
# end

# # What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.
#
# '4' == 4 ? puts("TRUE") : puts("FALSE") # "FALSE"
#
# x = 2
# if ((x * 3) / 2) == (4 + 4 - x - 3)
#  puts "Did you get it right?"
# else
#  puts "Did you?"
# end
# # "Did you get it right?"
#
# y = 9
# x = 10
# if (x + 1) <= (y)
#   puts "Alright."
# elsif (x + 1) >= (y)
#   puts "Alright now!"
# elsif (y + 1) == x
#   puts "ALRIGHT NOW!"
# else
#   puts "Alrighty!"
# end
# # Alright now!

# Rewrite your program from exercise 3 using a case statement. Wrap the statement from exercise 3 in a method and wrap this new case statement in a method. Make sure they both still work.

# def number_eval_case(number)
#   case
#   when number < 0
#     puts "Your can't enter a negative number!"
#   when number <= 50
#     puts "#{number} is between 0 and 50"
#   when number <= 100
#     puts "#{number} is between 51 and 100"
#   else
#     puts "#{number} is above 100!"
#   end
# end
#
#
# def number_eval_case2(number)
#   case number
#   when 0..50
#     puts "#{number} is between 0 and 50"
#   when 51..100
#     puts "#{number} is between 51 and 100"
#   else
#     if number < 0
#       puts "Number can't be negative!"
#     else
#       puts "#{number} is above 100!"
#     end
#   end
# end
#
# def number_eval(number)
#   if number < 0
#     puts "Your can't enter a negative number!"
#   elsif number <= 50
#     puts "#{number} is between 0 and 50"
#   elsif number <= 100
#     puts "#{number} is between 51 and 100"
#   else
#     puts "#{number} is above 100!"
#   end
# end
#
# puts "Please give me a number between 0 and 100"
# number = gets.chomp.to_i
# number_eval(number)
# number_eval_case(number)
# number_eval_case2(number)

# When you run the following code...
#
#     def equal_to_four(x)
#       if x == 4
#         puts "yup"
#       else
#         puts "nope"
#     end
#
#     equal_to_four(5)
# You get the following error message..
#
# test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end
# Need to include an additional end after if/else statement
# The end is currently matching up with the if/else, but no there no end for the method
