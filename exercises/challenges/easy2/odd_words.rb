# nouns: chraracter set(leters, a space, a point), words(1 or more, but at most 20 letters)
# input text: 1 or more words, separated by 1 or more spaces and terminated by 0
# or more spaces followed by a point. 
# output: only 1 space between words, last word ends with single point, odd
# words are reversed
#
# Bonus: characters must be read and printed one at a time.
# to read char by char C style, I can iterate through each char, one I finish a
# word, and start the next word, i can store the chars in a temp variable and
# then reverse it
#
# How do handle the case where the last word ends in 0 spaces and the period?
#

def reverse_odd_words(input_string)
  word_arr = input_string.scan(/\b\w+\b/)
  word_arr.each_with_index { |word, index| word.reverse! if index.odd? }
  output = word_arr.join(' ')
  output << '.'
end

def reverse_odd_words_bonus(input_string)
  input_string.strip!
  odd_word = false
  rev = ''
  input_string.chars.each_with_index do |char, index|
    current_char = char 
    next_char = input_string[index + 1]
    if new_word_found?(current_char, next_char)
      if odd_word
        print rev.reverse
        rev = ''
      end
      odd_word = !odd_word
      print ' '
    elsif is_alpha?(input_string[index]) && !odd_word
      print input_string[index] 
    elsif is_alpha?(input_string[index]) && odd_word
      rev << input_string[index] 
    end
  end
  print '.'
end

def is_alpha?(ch)
  ch >= 'a' && ch <= 'z'
end

def new_word_found?(current_char, next_char)
  current_char == ' ' && is_alpha?(next_char) 
end


puts reverse_odd_words_bonus('whats the matter with kansas.')
puts reverse_odd_words_bonus('      whats   the       matter     with kansas     .')
puts reverse_odd_words_bonus("hello.")
puts reverse_odd_words_bonus('')
puts reverse_odd_words_bonus("hello word   world .")
