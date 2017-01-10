def uppercase?(str)
  str.chars.each do |c|
    if c =~ /[a-z]/
      return false
    end
  end
  return true
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
