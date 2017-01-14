module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Noble < Person

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{@title} #{@name}"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end


class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"
#
kitty = Cat.new("Kitty")
kitty.walk
# # => "Kitty saunters forward"
#
flash = Cheetah.new("Flash")
flash.walk
# # => "Flash runs forward"
