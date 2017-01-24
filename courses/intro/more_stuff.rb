# # Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.
#
# words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
# words.each do |word|
#   if word =~ /lab/
#     p "Exists in #{word}!"
#   else
#     p "no match"
#   end
# end

# What will the following program print to the screen? What will it return?

# def execute(&block)
#   block # Nothing is printed to the screen because the block is never called with the call method
# end
#
# execute { puts "Hello from inside the execute method!" } # returns Proc object

# What is exception handling and what problem does it solve?
# It enables us to deal with errors in our program in a graceful manner without causing the code to crash
#
# Modify the code in exercise 2 to make the block execute properly.
# def execute(&block)
#   block.call
# end
#
# execute { puts "Hello from inside the execute method!" } # returns Proc object

# Why does the following code...
#
# def execute(block)
#   block.call
# end
#
# execute { puts "Hello from inside the execute method!" }
#
# Give us the following error when we run it?
#
# block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
# from test.rb:5:in `<main>'
#
# We forgot to define the execute method's block parameter with the '&' symbol that denotes blocks. The function call to execute doesn't know to accept the block as a parameter
