def match_parenthesis(str)
  word_arr = str.chars 
  # Define counter of parenthesis that will increment if paren is ( and
  # decrement if )
  paren_matching = 0
  word_arr.each do |c|
    if c == '(' 
      paren_matching += 1
    elsif c == ')'
      paren_matching -= 1
    end
    return false if paren_matching < 0
  end
  paren_matching == 0
end

str1 = "h(el)lo)("
puts match_parenthesis(str1)
