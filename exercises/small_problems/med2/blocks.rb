BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(str)
  up = str.upcase

  BLOCKS.none? { |pair| up.count(pair) >= 2 }
  
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
