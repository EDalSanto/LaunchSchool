NUMS = %w(zero one two three four five six seven eight nine ten)
OPS  = %w(plus minus times divided)

def mathphrase(n)
  res = ''
  n.times do 
    res += "#{NUMS.sample} "
    res += "#{OPS.sample} "
  end
  res += NUMS.sample
  res.gsub('divided', 'divided by')
end

p mathphrase(10)
