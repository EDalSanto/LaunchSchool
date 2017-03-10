class Palindromes
  attr_reader :min, :max, :all_palindromes

  def initialize(range)
    @min = range[:min_factor].to_i 
    @max = range[:max_factor].to_i
    @all_palindromes = []
  end

  def generate
    (min..max).each do |factor1|
      (factor1..max).each do |factor2|
        if Palindrome.is_palindrome?((factor1 * factor2))
          update_palindromes(factor1, factor2)
        end
      end
    end
  end

  def update_palindrome(palindrome, *new_factors)
    palindrome.factors << new_factors
  end
  
  def add_new_palindrome(*factors)
    all_palindromes << Palindrome.new(factors) 
  end

  def update_palindromes(factor1, factor2)
    existing_palindrome = find_existing_palindrome(factor1 * factor2)
    if existing_palindrome
      update_palindrome(existing_palindrome, factor1, factor2)
    else
      add_new_palindrome(factor1, factor2)
    end
  end

  def largest
    all_palindromes.max_by { |palindrome| palindrome.value }
  end

  def smallest
    all_palindromes.min_by { |palindrome| palindrome.value }
  end

  def find_existing_palindrome(product)
    all_palindromes.find { |palindrome| palindrome.value == product }
  end
end

class Palindrome
  attr_accessor :value, :factors

  def initialize(factors)
    @value = factors.reduce(:*)
    @factors = [factors]
  end

  def self.is_palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end
