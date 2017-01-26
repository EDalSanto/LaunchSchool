# create range of numbers from 2 to num
# 1 will start in list of primes
# delete all multiples of next number then continue to next..seems like you
# can iterate over the same array in this case!

class Sieve
  attr_reader :nums

  def initialize(limit)
    @nums = (2..limit).to_a
  end

  def primes
    nums.each { |prime_num| remove_multiples(prime_num) }
  end

  def remove_multiples(prime_num)
    nums.reject! do |candidate_prime|
      next if prime_num == candidate_prime

      (candidate_prime % prime_num).zero?
    end
  end
end
