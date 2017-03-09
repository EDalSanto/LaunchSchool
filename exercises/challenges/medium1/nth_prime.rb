class Prime
  
  def self.nth(n)
    raise ArgumentError if n.zero?

    Prime.new.nth(n)
  end

  def nth(n)
    return 2 if n == 1

    primes_found = 1
    prime_candidate = 3
    while 1 
      primes_found += 1 if is_prime?(prime_candidate)
      return prime_candidate if primes_found == n
      prime_candidate += 2
    end
  end

  def is_prime?(num)
    last_num_to_check = Math.sqrt(num).floor
    2.upto(last_num_to_check).each do |divisor|
      return false if (num % divisor).zero?
    end
    true
  end
end
