# Perfect number: sum of a number's positive divisors exluding the number itself
# equals the number; known as Aliquot sum
# Abundant number: sum > number
# Deficient: sum < number
#
# Create Perfectnumbe class with initialized number
# Find number's divisors
# Find the sum of divisiors
# Classify based on above rules
#
#
class PerfectNumber
  attr_reader :num
  
  def initialize(num)
    @num = num
  end

  def self.classify(num)
    raise RuntimeError if num < 0

    PerfectNumber.new(num).classify
  end

  def classify
    sum = divisors.reduce(&:+)
    case
      when sum == num then 'perfect'
      when sum > num  then 'abundant'
      when sum < num  then 'deficient'
    end
  end

  def divisors
    1.upto(num - 1).select { |candidate| (num % candidate).zero? }
  end
end
