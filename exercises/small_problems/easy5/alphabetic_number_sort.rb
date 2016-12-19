# Sort numbers based on English word spelling only between 0 and 19
# Creating mapping as constant, hash between numbers and their corresponding
# english words

NUMS = 
{
  19=>"nineteen",
  18=>"eighteen",
  17=>"seventeen", 
  16=>"sixteen",
  15=>"fifteen",
  14=>"fourteen",
  13=>"thirteen",              
  12=>"twelve",
  11 => "eleven",
  10 => "ten",
  9 => "nine",
  8 => "eight",
  7 => "seven",
  6 => "six",
  5 => "five",
  4 => "four",
  3 => "three",
  2 => "two",
  1 => "one", 
  0 => "zero"
}

def alphabetic_number_sort(num_arr)
  num_arr.sort { |a, b| NUMS[a] <=> NUMS[b] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0]
