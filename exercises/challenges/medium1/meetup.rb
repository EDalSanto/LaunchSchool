require 'date'

class Meetup
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
    @schedule_beginning = {
      first: 1,
      second: 8,
      teenth: 13,
      third: 15,
      fourth: 22,
      last: -7
    }
  end

  def day(weekday, schedule)
    date = Date.new(year, month, @schedule_beginning[schedule])  

    (date..(date + 6)).find { |date| date.send("#{weekday}?") }
  end
end
