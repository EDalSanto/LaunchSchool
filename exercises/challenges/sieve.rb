class Sieve
  
  def initialize(num)
    @num = num
    @primes = [1]
  end

  def primes
    # create range of numbers from 2 to num
    range = (2..@num).to_a
    # delete all multiples of next number then continue to next..seems like you
    # almost iterate over the same array in this case!
    range.each do |current_num|
      range.delete_if do |m| 
        m % current_num == 0 && m != current_num
      end
    end
  end

end
