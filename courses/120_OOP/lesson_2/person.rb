class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_name(full_name)
  end

  def name
    puts "#{@first_name} #{@last_name}".strip
  end

  def name=(full_name)
    parse_name(full_name)
  end

  def parse_name(full_name)
    parts = full_name.split
    self.first_name = (parts[0] == nil) ? '' : parts[0]
    self.last_name = (parts[1] == nil) ? '' : parts[1]
  end

end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.name == rob.name
