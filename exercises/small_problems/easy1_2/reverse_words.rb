# If str.length less than 5, do nothing
# else str.reverse
# need to map over array of words

def reverse_words(str)
  arr = str.split.map do |word|
    if word.length > 4
      word.reverse!
    else
      word
    end
  end
  arr.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
