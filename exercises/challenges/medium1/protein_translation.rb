# Input: RNA sequences
# Output: proteins
# Algo: RNA to Codons to Protein
#       - If one of four terminating codons(STOP codons) encoutnered, all
#       translation ends and the protein is terminate
#
#
#
class Translation
  STOPS = [:UAA, :UAG, :UGA]
  CODONS = {
              AUG: 'Methionine',
              UUU: 'Phenylalanine', 
              UUC: 'Phenylalanine',
              UUA: 'Leucine',
              UUG: 'Leucine',
              UCU: 'Serine',
              UCC: 'Serine',
              UCA: 'Serine',
              UCG: 'Serine',
              UAU: 'Tyrosine',
              UAC: 'Tyrosine',
              UGU: 'Cysteine',
              UGC: 'Cysteine',
              UGG: 'Tryptophan',
              UAA: 'STOP', 
              UAG: 'STOP', 
              UGA: 'STOP'
           }

  def self.of_codon(codon)
    CODONS.fetch(codon.to_sym) { fail InvalidCodonError }
  end

  def self.of_rna(strand)
    codons = strand.scan(/[UGAC]{3}/).take_while do |codon| 
      Translation.of_codon(codon) != 'STOP'
    end

    codons.map { |codon| Translation.of_codon(codon) }
  end
end
