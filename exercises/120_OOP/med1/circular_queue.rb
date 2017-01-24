class CircularQueue

  def initialize(size)
    @queue = [] 
    @max_size = size
  end

  def enqueue(element)
    dequeue if @queue.size == @max_size
    @queue.push(element)
  end

  def dequeue
    @queue.shift
  end
end

class CircularQueueLONG

  def initialize(size)
    @queue = Array.new(size) 
    @next_index = 0
    @longest_index = 0 
  end

  def update_position(index)
    index = (index + 1) % @queue.size
  end

  def enqueue(element)
    if @queue.all? { |n| !n.nil? }
      @longest_index = update_position(@longest_index)
    end

    @queue[@next_index] = element
    @next_index = update_position(@next_index) 
  end

  def dequeue
    to_pop = @queue[@longest_index] 
    @queue[@longest_index] = nil
    @longest_index = update_position(@longest_index) unless to_pop.nil?
    to_pop
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
