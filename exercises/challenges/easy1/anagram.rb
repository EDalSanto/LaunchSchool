# Anagrams are rearrangements of letter into other words
# in tests, detector is instance of Anagram class
# invoking match instance method with array of strings leads to list of anagrams
# for given word detector
# 1 create new Anagram class 
#   A. Anagram class is initiated with string word
# 2 create match method that takes array of strings and checks for each word if
# word is anagram of initial word
#
# letter count of of both words must be the same for words to be anagram
    # creating a historgram of initial word and comparing would enable easy,
    # scalable caring

class Anagram
  attr_reader :word_hist, :word

  def initialize(word)
    @word = word
    @word_hist = histogram(word)
  end

  def match(words_arr)
    words_arr.select { |candidate| is_anagram?(candidate) } 
  end

  def is_different_word?(candidate)
    candidate.downcase != word
  end

  def is_anagram?(candidate)
    (is_different_word?(candidate)) && (histogram(candidate) == word_hist)
  end

  def histogram(word)
    hist = Hash.new(0) 
    word.each_char { |ch| hist[ch.downcase] += 1 } 
    hist
  end

end
