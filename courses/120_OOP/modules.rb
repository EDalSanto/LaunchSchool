# Multiple Inheritance correct example
# jump and dig are only defined in one place and can be included in as many classes as we would like. Modules encapsulate behaviors and then provide them to each class where included. 
# A lot cleaner and more organized code than the altenative you'll see below

module Jumpable
  def jump 
    puts "I can jump!"
  end 
end 

module Diggable
  def dig 
    puts "I can dig holes!"
  end
end 

class Animal
  def alive 
    puts "I'm alive!"
  end 
end

class Dog < Animal
  include Jumpable
  include Diggable 
end

class Cat < Animal
  include Jumpable
end 

class Racoon < Animal
  include Diggable
end

class Cow < Animal 
end 

# Alternative with no module mixins; Dog can't inherit both form JumpableAnimal class and DiggableAnimal class, like it can inherit from both modules above  

class Animal
  def alive 
    puts "I'm alive!"
  end 
end

class JumpableAnimal < Animal 
  def jump 
    puts "I can jump!"
  end 
end 

class NonJumpableAnimal < Animal 
end

class DiggableAnimal < Animal 
  def dig 
    puts "I can dig a hole!"
  end 
end 

class NonDiggableAnimal < Animal 
end 

class Dog < JumpableAnimal 
  # but waittt a dog can also dig, but can't inherit from both JumpableAnimal and DiggableAnimal classes 
  #  We could define the dig method directly in Dog, but then we'd have it in two places, and what if another animal has a dig behavior? We'd have to define the dig method potentially in many other places without using modules as mixins. Using modules enable us to only define these methods once and include them wherever is necessary  
end

class Racoon < DiggableAnimal
end 

class Cat < JumpableAnimal
end 

class Cow < NonJumpableAnimal
end
