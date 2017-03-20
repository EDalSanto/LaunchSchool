# normalize => remove spaces and pucntuation and downcase
#
# rows => perfect square of num characters or next greatest perfect

class Crypto
  attr_accessor :original_text

  def initialize(original_text)
    @original_text = original_text
  end

  def normalize_plaintext
    original_text.gsub(/[^\w\d]/, '').downcase
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/\w{#{size}}|\w+|\d+/)
  end

  def ciphertext
    res = ''
    segments = plaintext_segments
    0.upto(size - 1) do |index|
      segments.each do |segment|
        next unless segment[index]
        res << segment[index] 
      end
    end
    res
  end

  def num_segments_for_ciphertext 
    Math.sqrt(ciphertext.size).ceil
  end

  def max_segment_size
    (ciphertext.size / num_segments_for_ciphertext).ceil
  end

  def normalize_ciphertext
    res = ''
    res
  end
end
