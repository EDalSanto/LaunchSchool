def center_of(str)
  half = str.size / 2
  if str.size.odd? 
    str[half]
  else
    str[half-1..half]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
