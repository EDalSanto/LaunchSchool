# Five lines to print, varibale -- equal to string len + 2 for empty


def print_in_box(str)
  width = 2 + str.length
  puts "+#{'-' * width}+"
  puts "|#{' ' * width}|"
  puts "| #{str} |"
  puts "|#{' ' * width}|"
  puts "+#{'-' * width}+"
end

print_in_box('To boldly go where no one has gone before.')

print_in_box('')
