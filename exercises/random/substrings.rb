def substrings(str)
  substrings = []
  word_arr = str.chars
  word_arr.each_with_index do |c, idx|
    # slice word_arr from current index up
    if idx != 0 
      sliced = str[idx..-1] 
    else
      sliced = str[idx...-1]
    end
    0.upto((sliced.size - 1)) do |i|
      substrings << sliced[0..i]
    end
  end
  substrings
end

p substrings("hello")
# ['h, 'e', 'l', 'l', 'o']
# each char itself
# each char plus all combinations of chars infront of it 
