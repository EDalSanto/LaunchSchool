def substrings_at_start(str)
  substrings = []
  0.upto(str.size - 1) do |i|
    current_substring = str[0..i]
    substrings << current_substring
  end
  substrings
end

if __FILE__ == $0
  puts substrings_at_start('abc') == ['a', 'ab', 'abc']
  puts substrings_at_start('a') == ['a']
  puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
end
