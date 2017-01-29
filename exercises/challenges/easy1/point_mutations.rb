# nouns: DNA, strand, hamming_distance, mutations
# verbs: calculate hamming 
# constraints: only compares for equal length strings, otherwise stops
# comparison
#
#
class DNA
  attr_reader :original

  def initialize(original)
    @original = original
  end

  def hamming_distance(mutated)
    hamming_distance = 0
    find_min_len(mutated).times do |i|
      hamming_distance += 1 if original[i] != mutated[i]
    end
    hamming_distance
  end

  def find_min_len(mutated)
    original.size > mutated.size ? mutated.size : original.size  
  end
end
