# nouns: phrases, words, occurences
# verbs: count
# return: histogram of words in phrase
#
# create word_arr
# created histogram from word_arr
#
# punctuation: I need to split (capture word to array) after each consecutive
# string of letters and/or numbers
#
## Super Regex Version ##
#
class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_arr
    phrase.scan(/\b[\w?']+\b/)
  end

  def word_count
    create_histogram(word_arr)
  end

  def create_histogram(word_arr)
    word_arr.each_with_object(Hash.new(0)) do |word, word_hist|
      word_hist[word] += 1
    end
  end
end
