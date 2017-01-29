# nouns: word, scrabble score
# input: word
# output: scrabble score
# 
# Scrabble class with word input for initialize
# score method based on letter/value
#
class Scrabble
  attr_reader :letters

  SCORE_MAP = {
    AEIOULNRST: 1,
    DG:         2,
    BCMP:       3,
    FHVWY:      4,
    K:          5,
    JX:         8,
    QZ:         10
  }

  def initialize(word)
    @letters =  all_alpha?(word) ? word.upcase.chars : nil
  end

  def score
    return 0 if letters.nil?

    letters.reduce(0) do |total, letter|
      total + find_value(letter)
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def find_value(letter)
    SCORE_MAP.each do |symbols, value|
      return value if symbols.match(letter)
    end
  end

  def all_alpha?(word)
    !word.nil? && word.chars.all? { |c| c =~ /\w/ }
  end
end
