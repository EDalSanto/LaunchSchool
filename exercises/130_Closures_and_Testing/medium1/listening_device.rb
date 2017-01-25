class Device
  attr_reader :recordings

  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def play
    puts recordings.last 
  end

  def listen
    record(yield) if block_given?
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!" 
