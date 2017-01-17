require 'pry'

r = [[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    binding.pry
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        binding.pry
        n + 1
      end
    end
  end
end
