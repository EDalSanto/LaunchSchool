class Animal
  
  def initialize(name)
    @name = name
  end

  def behavior
    @b = 'hi'
  end
end

fido = Animal.new('Fido')
jim = Animal.new('Jim')
fido.behavior
p fido
p jim
