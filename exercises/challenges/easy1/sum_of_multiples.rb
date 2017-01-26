class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def self.to(limit)
    new(3, 5).to(limit)
  end

  def to(limit)
    nums = (0...limit)
    multiples = select_multiples(nums)
    multiples.reduce(&:+)
  end

  def select_multiples(nums)
    nums.select do |num|
      divisible_by_any_factors?(num)
    end
  end

  def divisible_by_any_factors?(num)
    @factors.any? { |factor| (num % factor).zero? }
  end
end
