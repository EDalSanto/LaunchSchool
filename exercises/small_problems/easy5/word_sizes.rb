# word_arr, find length of current word, update Hash array counts

def alpha_length(word)
  length = 0
  word.chars.each do |c|
    length += 1 if c =~ /[[:alpha:]]/
  end
  length
end

def word_sizes(str)
  hist = Hash.new(0)
  word_arr = str.split
  word_arr.each do |word|
    hist[alpha_length(word)] += 1
  end
  hist
end

# Official Solution using String#delete
def word_sizes(str)
  hist = Hash.new(0)
  word_arr = str.split
  word_arr.each do |word|
    clean_word = word.delete('^A-Za-z')
    hist[clean_word.length] += 1
  end
  hist
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1}
puts word_sizes('') == {}
