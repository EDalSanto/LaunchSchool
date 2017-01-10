require_relative 'substrings'

def is_palindrome?(str)
  return false if str.size == 1
  str == str.reverse
end

def palindromes(str)
  subs = substrings(str)
  subs.select { |word| is_palindrome?(word) }  
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada', 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did', '-madam-', 'madam', 'ada', 'oo' ]
puts palindromes('knitting cassettes') == [
'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
