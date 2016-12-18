def prompt(msg)
  puts "==> #{msg}" 
end

def number_appears?(arr, num)
  arr.each do |e|
    return true if e == num
  end
  return false
end

if __FILE__ == $0
  nums = []
  last = nil
  orders = ['1st', '2nd', '3rd', '4th', '5th', 'last']
  orders.each do |order|
    prompt("Enter the #{order} number:") 
    input = gets.chomp.to_i
    nums << input if order != 'last'
    last = input if order == 'last'
  end

  if number_appears?(nums, last)
    puts "The number #{last} appears in #{nums}."
  else
    puts "The number #{last} does not appear in #{nums}."
  end

end
