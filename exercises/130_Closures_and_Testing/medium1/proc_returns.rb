# Group 1
def check_return_with_proc
  my_proc = proc { return }
  # call to proc object my_proc causes return from method and thus puts is never
  # executed
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

# can't return from proc that is defined in main scope and passed in as
# argument?
# check_return_with_proc_2(my_proc)

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  # lambda return does not cause return of method..
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  # again, here no return with lambda
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  # just like proc object
  yield
end

block_method_3 { return }
