class GoodDog

  def initialize(h, w, n)
    @height = h
    @weight = w
    @name = n
  end

  def info
    "I'm a GoodDog!"
  end

  def change_height
    self
  end

  def to_s
    info
  end

  def display_height
    puts self.height
  end

  private

    attr_accessor :height, :weight, :name
end

dog = GoodDog.new(70, 100, "Joe")
puts dog.change_height
dog.display_height
