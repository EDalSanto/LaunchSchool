# -input: non-pig latin words 
# -output of translate: each word in string has been translated to pig latin
#   - rules:
#     - if word begins with vowel sound, add an "ay" sound to end of the word
#     - if a word begins with a consonant sound, move it to the end of the word,
#     and than add "ay" to the end of word
#
# Afterthoughts: Initially didn't make good use of Regex, but still got a
# working solution. It wasn't too bad, but using Regex makes it MUCH easier and
# cleaner for refactoring

class PigLatin
  VOWEL_CASE = /^[aeiou]|[xy][^aeiou]+/
  CONSONANT_CASE = /^([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/

  def self.translate(phrase)
    PigLatin.new.translate(phrase)
  end

  def translate(phrase)
    phrase.split.map { |word| new_piglatin_word(word) }.join(' ')
  end

  def new_piglatin_word(word)
    if word.match(VOWEL_CASE) 
      word + 'ay'
    else
      handle_consonant_case(word)
    end
  end

  def handle_consonant_case(word)
    consonant_split = word.match(CONSONANT_CASE)
    consonant_split[2] + consonant_split[1] + 'ay'
  end
end
