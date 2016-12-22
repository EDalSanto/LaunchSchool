def swapcase(str)
  char_arr = str.chars.map do |c|
    if c =~ /[a-z]/
      c.upcase
    elsif c =~ /[A-z]/
      c.downcase 
    else
      c
    end
  end
  char_arr.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
