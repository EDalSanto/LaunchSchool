# Understand the Problem
#   -Answer seems to be an array of all the perfect squares less than or equal
#   to n
#   -All swithes toggles on for the first pass
#   -Toggle all multiples of 2 switches on the second pass
#   -Toggle all multiples of 3 
#   -For any given pass, the number of switches toggled is equal to the pass
#   number and all of its multiples up to n
#   -Edge Cases: 0
#   -Bad input: negative numbers
#

# Test cases
# lightsOn(5) => [1, 4]
# lightsOn(100) => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
# lightsOn(0) => []
# lightsOn(50) => [1, 4, 9, 16, 25, 36, 49]
#

#################    "Mathematical Version"     #####################

# Pseudo
# -initialize array of on lights
# -find all perfect squares less than or equal to n
#   -start at i = 1
#   -while i**2 <= n
#     -add i**2 to list
#     -increment i by 1
# -return array

#def lightsOn(n)
#  return "Invalid input, n cannot be negative!" if n < 0 
#  on_arr = [] 
#  last_perfect_square_root = 1
#  while last_perfect_square_root**2 <= n
#    on_arr << last_perfect_square_root**2 
#    last_perfect_square_root += 1
#  end
#  on_arr
#end

#################    "Progromatic Version"     #####################

# Pseudo 2
# initialize on_arr as array of 0s to signal off
# set pass = 0
# while pass less than or equal to n
  # toggle(change to 1 in this case) a given indice if the indice + 1(because of zero
  # indexing) is a multiple of pass
  # increment pass by 1
# return on_arr

def is_multiple?(num1, num2)
  num1 % num2 == 0
end

def select_on_lights(light_arr)
  on_arr = []
  light_arr.each_index do |i| 
    on_arr << i + 1 if light_arr[i] == true 
  end
  on_arr
end

def toggle_light(light_arr, index)
  light_arr[index] = (light_arr[index] == false ? true : false)
end

def lightsOn(n)
  return "Invalid input, n cannot be negative!" if n < 0 
  light_arr = Array.new(n, false)  
  (1..n).each do |pass|
    light_arr.each_index do |index|
        toggle_light(light_arr, index) if is_multiple?(index + 1,pass) 
    end
  end
  select_on_lights(light_arr)
end

p "lightsOn(5): #{lightsOn(5)}" 
p "lightsOn(2): #{lightsOn(2)}" 
p "lightsOn(100): #{lightsOn(100)}" 
p "lightsOn(1000): #{lightsOn(1000)}" 
p "lightsOn(0): #{lightsOn(0)}" 
p "lightsOn(50): #{lightsOn(50)}"
p "lightsOn(-1): #{lightsOn(-1)}"
