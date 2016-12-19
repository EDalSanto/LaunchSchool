MINS_IN_HOUR = 60
MINS_IN_DAY = 1440

def before_midnight(time)
  hours = time[0..1].to_i 
  mins = time[3..4].to_i
  (MINS_IN_DAY - (hours * MINS_IN_HOUR + mins)) % MINS_IN_DAY
end

puts before_midnight('00:00') == 0
puts before_midnight('12:34') == 686
puts before_midnight('24:00') == 0
