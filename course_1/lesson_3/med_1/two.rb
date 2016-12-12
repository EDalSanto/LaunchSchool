statement = "The Flintstones Rock"
hist = Hash.new(0) 
statement.chars.each { |char| hist[char] += 1 }
p hist 

#or
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_freq = statement.scan(letter).count
  result[letter] = letter_freq if letter_freq > 0
end
