# Look at the following programs...

x = 0
3.times do
  x += 1
end
puts x

# and...

y = 0
3.times do
  y += 1
  x = y
end
puts x

# What does x print to the screen in each case? Do they both give errors? Are the errors different? Why?

# In the 1st case, x prints 3
# In the 2nd case, prints an undefined local variable or method error because we're trying to access x outside the scope of the do/end block

# What does the following error message tell you?
#
# NameError: undefined local variable or method `shoes' for main:Object
#   from (irb):3
#   from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# The program is trying to access a varibale or method names shoes that is being called outside of its scope or doesn't actually exist 
