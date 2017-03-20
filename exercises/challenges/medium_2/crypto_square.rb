class Crypto
  def initialize(original_text)
    @original_text = original_text
    @normalized_plaintext = original_text.gsub(/[^\w]/, '').downcase
  end

  def normalize_plaintext
    @normalized_plaintext
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    encode_plaintext
  end

  def normalize_ciphertext
    encode_plaintext(' ')
  end

  def encode_plaintext(delimeter='')
    padded_segments = plaintext_segments.map { |seg| right_pad(seg) }
    padded_segments.map(&:chars).transpose.map(&:join).map(&:strip).join(delimeter)
  end

  def right_pad(seg)
    seg + (' ' * (size - seg.size))
  end
end
