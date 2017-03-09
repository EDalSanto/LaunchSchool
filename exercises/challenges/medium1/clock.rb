class Clock
  attr_accessor :total_minutes
  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY = 1440
  
  def initialize
    @total_minutes = 0
  end

  def self.at(hours, minutes=0)
    new_clock = Clock.new
    new_clock.set_time(hours, minutes)
    new_clock
  end

  def set_time(hours, minutes)
    self.total_minutes = (hours * MINUTES_IN_HOUR) + minutes
  end

  def hours 
    total_minutes / MINUTES_IN_HOUR
  end

  def minutes
    total_minutes % MINUTES_IN_HOUR
  end

  def+(minutes_to_add)
    self.total_minutes += minutes_to_add
    self.total_minutes = self.total_minutes % MINUTES_IN_DAY

    self
  end

  def-(minutes_to_subtract)
    self.total_minutes -= minutes_to_subtract
    self.total_minutes = (self.total_minutes + MINUTES_IN_DAY) % MINUTES_IN_DAY 

    self
  end

  def==(other)
    self.to_s == other.to_s 
  end


  def to_s
    "#{format('%02i', hours)}:#{format('%02i', minutes)}"
  end
end
