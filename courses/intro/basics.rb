# Add two strings together that, when concatenated, return your first and last name as your full name in one string.
#
# "<Firstname> <Lastname>"
# For example, if your name is John Doe, think about how you can put "John" and "Doe" together to get "John Doe"

fullname = "Firstname " + "Lastname"

# Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the:
# 1) thousands place
  number / 1000
# 2) hundreds place
  number % 1000 / 100
# 3) tens place
  number % 1000 % 100 / 10
# 4) ones place
  number % 1000 % 100 % 10

# Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.
#
# 1975
# 2004
# 2013
# 2001
# 1981
#
movies = { :movie1 => 1975, :movie2 => 2004, :movie3 => 2013, :movie4 => 2001, :movie5 => 1981 }
puts movies[:movie1]
puts movies[:movie2]
puts movies[:movie3]
puts movies[:movie4]
puts movies[:movie5]
# # Or we can use a block..
# movies.each { |movie, year| puts movies[movie] }

# Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.
#
years = [1975, 2004, 2013, 2001, 1981]
puts years[0], years[1], years[2], years[3], years[4]
# # Or we can use a block again..
# years.each { |year| puts year }

# Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.
fact_5 = 5 * 4 * 3 * 2 * 1
fact_6 = 6 * 5 * 4 * 3 * 2 * 1
fact_7 = 7 * 6 * 5 * 4 * 3 * 2 * 1
fact_8 = 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

# # Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.
puts 3.5 ** 2
puts 5.3 ** 2
puts 6.1 ** 2

# What does the following error message tell you?
#   SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
#     from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
#
There's an open hash somewhere with a proper closing. Seems like someone was making a hash and closed it with a ')' instead of a '}', leading to this syntax error. 
