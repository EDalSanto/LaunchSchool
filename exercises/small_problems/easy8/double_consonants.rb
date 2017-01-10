CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)


def double_consonants(str)
  doubled = str.chars.map do |c|  
    CONSONANTS.include?(c.downcase) ? c * 2 : c 
  end
  doubled.join
end

puts double_consonants('String')
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
