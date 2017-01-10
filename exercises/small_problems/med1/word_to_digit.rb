DIGIT_HASH = {
'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4','five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'}.freeze

def word_to_digit(str)
  DIGIT_HASH.keys.each do |word|
    str.gsub!(/\b#{word.downcase}\b/, DIGIT_HASH[word])
  end
  str.gsub!(/(\d)\s/, '\1')
  str.gsub(/(\d{3})(\d{3})(\d{4})/) {
    format("(%s) %s-%s", $1, $2, $3) 
  }
end

p word_to_digit('Please call me at five five five one two three four five six seven. Thanks.')
                      # => "Please call me at (555) 123-4567. Thanks."
