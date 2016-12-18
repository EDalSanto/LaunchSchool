# time of day represented as number of minutes before or after midnight 
# if mins > 0 -> after midnight
# elsif main < 0 -> before midnight
# else midnight
# find miniutes in day and then mod mins by this

MINS_DAY = 60 * 24
MINS_HOUR = 60

def time_of_day(mins)
  adj_mins = mins % MINS_DAY 
  hours, mins = adj_mins.divmod(MINS_HOUR) 
  format('%02d:%02d', hours, mins)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
