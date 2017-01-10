def letter_percentages(str)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  total_chars = str.size
  str.chars.each do |c| 
    if c =~ /[a-z]/ 
      hash[:lowercase] += 1 
    elsif c =~ /[A-Z]/ 
      hash[:uppercase] += 1 
    else
      hash[:neither] += 1 
    end
  end
  hash.each do |k, v|
    hash[k] = (v.to_f / total_chars) * 100
  end
  hash
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 } 
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
