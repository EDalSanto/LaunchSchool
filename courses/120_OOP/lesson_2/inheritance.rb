class Pet

  def run 
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Dog < Pet

  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching'
  end

end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  
  def speak
    'meow!'
  end

end

puts Bulldog.ancestors
