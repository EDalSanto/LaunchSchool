# Circular buffer can be achieved using an Array
# value passed in with #initialize will be max size
# all new elements will be written to end of array with << operator
# reading from buffer will always occur from the beginning of array with shift
# overwriting data will require
#   -shifting off oldest data(read)
#   -adding new data to end(normal write)
#
class CircularBuffer
  attr_accessor :buffer
  attr_reader   :max_size

  def initialize(max_size)
    @max_size = max_size
    @buffer = []
  end

  def full?
    buffer.size == max_size
  end

  def empty?
    buffer.size == 0
  end

  def remove_oldest_element
    buffer.shift
  end

  def clear
    self.buffer = []
  end

  def read
    raise BufferEmptyException if empty?

    remove_oldest_element
  end

  def write(new_element)
    raise BufferFullException if full?

    buffer << new_element if !new_element.nil?
  end

  def write!(new_element)
    return if new_element.nil?

    remove_oldest_element if full?
    write(new_element)
  end

  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end
end
