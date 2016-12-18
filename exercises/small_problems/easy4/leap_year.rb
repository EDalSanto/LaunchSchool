# leap year when year % 4 == 0 && !(year % 100 == 0)
#
#def leap_year?(year)
#  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
#end

def leap_year?(year)

  if year % 4 == 0 && year % 100 != 0
    true
  else
    year % 400 == 0
  end
    
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
