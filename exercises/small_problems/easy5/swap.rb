# Break string into words arr
# Perform word swap on each word in array
# join

def swap_word(word)
  temp = word[0]
  word[0] = word[-1]
  word[-1] = temp 
  word
end

def swap(str)
  word_arr = str.split  
  word_arr.map { |word| swap_word(word) }.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA' 
puts swap('a') == 'a'
