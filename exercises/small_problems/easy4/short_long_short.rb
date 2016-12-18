def short_long_short(str1, str2)
  longer = (str1.length > str2.length) ? str1 : str2
  shorter =  (longer == str1) ? str2 : str1 
  shorter + longer + shorter
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
