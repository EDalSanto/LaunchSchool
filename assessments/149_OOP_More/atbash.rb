class Encoder
  ALPHABET = ('a'..'z').to_a
  REVERSE_ALPHABET = ('a'..'z').to_a.reverse

  def initialize
    @mapping = {}
    create_mapping
  end

  def create_mapping
    ALPHABET.each_with_index do |letter, index|
      @mapping[letter] = REVERSE_ALPHABET[index]
    end
  end

  def transform(letter)
    @mapping[letter]
  end

  def five_token?(transformed_text)
    transformed_text.split.all? { |word| (word.size % 5).zero? }
  end

  def add_space(transformed_text)
    transformed_text << ' '
  end

  def valid_input?(letter)
    letter =~ /[a-z]/ || letter =~ /\d/
  end
end

class Atbash
  ENCODER = Encoder.new
  ALPHA = /[a-z]/
  NUMBER = /\d/

  def initialize
    @transformed = ''
  end

  def self.encode(word)
    Atbash.new.encode(word)
  end

  def encode(word)
    word.chars.each do |letter|
      letter.downcase!
      next unless ENCODER.valid_input?(letter)
      encode_letter(letter)
      ENCODER.add_space(@transformed) if ENCODER.five_token?(@transformed)
    end
    @transformed.strip
  end

  def encode_letter(letter)
    if letter =~ ALPHA
      @transformed << ENCODER.transform(letter)
    elsif letter =~ NUMBER
      @transformed << letter
    end
  end
end
