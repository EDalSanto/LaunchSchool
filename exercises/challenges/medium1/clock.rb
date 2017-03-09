class Clock
  attr_accessor :total_minutes
  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY = 1440
  
  def initialize(total_minutes)
    @total_minutes = total_minutes 
  end

  def self.at(hours, minutes=0)
    new(hours * MINUTES_IN_HOUR + minutes)
  end

  def hours 
    total_minutes / MINUTES_IN_HOUR
  end

  def minutes
    total_minutes % MINUTES_IN_HOUR
  end

  def +(minutes_to_add)
    Clock.new((self.total_minutes + minutes_to_add) % MINUTES_IN_DAY)
  end

  def -(minutes_to_subtract)
    Clock.new((self.total_minutes - minutes_to_subtract) % MINUTES_IN_DAY)
  end

  def ==(other)
    self.to_s == other.to_s 
  end


  def to_s
    format_minutes
  end

  private
    
    def format_minutes
      "#{format('%02i', hours)}:#{format('%02i', minutes)}"
    end
end
