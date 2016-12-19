MINS_IN_HOUR = 60
MINS_IN_DAY = 1440

def after_midnight(time)
  hours = time[0..1].to_i 
  mins = time[3..4].to_i
  (hours * MINS_IN_HOUR + mins) % MINS_IN_DAY
end

puts after_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts after_midnight('24:00') == 0
