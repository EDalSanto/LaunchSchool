# Group 1
# Proc object my_proc created below
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
# Can call proc like we can call a method
# And proc can be called without correct number of arguments -> nil assigned to
# block variable
my_proc.call
my_proc.call('cat')

# Group 2
# lambda can be created two ways: with keyword and with ->
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# a lambda is a particular type of proc object
puts my_lambda
puts my_second_lambda
puts my_lambda.class
# lambdas must be called with argument, otherwise throw ArgumentError
my_lambda.call('dog')
my_lambda.call('cat')
# Cannot create Lambda like this
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# Group 3
def block_method_1(animal)
  yield if block_given?
end

# not passing argument to block yield means arg never gets there to block
block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal, 'seal')
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { |animal| puts "This is a #{animal}."}

# Procs: call be called with or without expected argument
# Lambdas: need to have exact argument match
# Blocks: can be called with as many arguments as you'd like
