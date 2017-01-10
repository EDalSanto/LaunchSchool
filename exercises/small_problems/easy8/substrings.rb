require_relative 'substrings_at_start'

def substrings(str)
  substrings = []
  0.upto(str.size - 1) do |i|
    current_str = str[i..-1]
    substrings << substrings_at_start(current_str)
  end
  substrings.flatten
end

if __FILE__ == $0
  p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde', 
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
]
end
