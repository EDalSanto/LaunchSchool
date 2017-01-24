# def greeting(name)
#   "Nice to meet you #{name}!"
# end
# puts "Hi there, what's your name?"
# name = gets.chomp
# greeting(name)

# What do the following expressions evaluate to?
# => means evaluates to ...
# 1. x = 2
# => 2
#
# 2. puts x = 2
# 2
# => nil
#
# 3. p name = "Joe"
# "Joe"
# => "Joe"
#
# 4. four = "four"
# => "four"
#
# 5. print something = "nothing"
# "nothing" => nil

# # def multiply(num1, num2)
# #   num1 * num2
# # end
# #
# # multiply(3,5) == 15 # true
#
# # What will the following code print to the screen?
#
# def scream(words)
#   words = words + "!!!!"
#   return
#   puts words
# end
#
# scream("Yippeee") # will not print anything to screen, because it returns before puts statement
#
# # 1) Edit the method in exercise #4 so that it does print words on the screen. 2) What does it return now?
#
# def scream(words)
#   words = words + "!!!!"
#   puts words
# end
#
# scream("Yippeee") # returns nil

# What does the following error message tell you?
#
# ArgumentError: wrong number of arguments (1 for 2)
#   from (irb):1:in `calculate_product'
#   from (irb):4
#   from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
#
# A method was passed 1 argument when the method expects 2
