class FakeArray
  def initialize(array)
    @elements = array
  end

  def []=(index, element)
    @elements[index] = element
  end

  def [](index)
    @elements[index]
  end
end

array = FakeArray.new([])
array[0] = 23
array.[]=(1, 42)
#puts "0th element: #{array[0]} 1st element: #{array[1]}"
