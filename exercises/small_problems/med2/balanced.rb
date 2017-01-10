def balanced?(str)
  parens = 0
  str.chars.each do |c|
    if c == ')' && parens <= 0 
      return false
    elsif c == '('
      parens += 1
    elsif c == ')'
      parens -= 1
    end
  end
  parens == 0
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
