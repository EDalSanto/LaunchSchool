class Vehicle
  @@total_num_vehicles = 0
  attr_accessor :color
  attr_reader   :year

  def initialize
    @@total_num_vehicles += 1
  end

  def speed_up(num)
    @current_speed += num 
  end

  def brake(num)
    @current_speed -= num if @current_speed >= num
  end

  def current_speed
    puts "Your current speed is #{@current_speed}"
  end

  def shut_off
    @current_speed = 0
  end

  def spray_paint(new_color)
    @color = new_color
  end

  def self.num_vehicles
    puts "There are #{@@total_num_vehicles} vehicles!"
  end

  def gas_mileage(miles, gallons)
    puts "#{miles / gallons} miles per gallon for my vehicle!"
  end

  def display_age
    puts "age of vehicle: #{age}"
  end

  private

    def age
      Time.now.year - year 
    end
end

module Driftable
  def drift
    puts "vrooommmmm schreeeech. Turned around corner!"
  end
end

class MyTruck < Vehicle
  NUM_DOORS = 2
end

class MyCar < Vehicle
  include Driftable
  NUM_DOORS = 4

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end
  
  def to_s
    "My car is a #{@color} #{@model}"
  end

end

if __FILE__ == $0
  car = MyCar.new(2012, "Red", "Jaguar")
  car.speed_up(60)
  car.current_speed
  car.brake(5)
  car.current_speed
  car.shut_off
  car.current_speed
  puts "Your car's color is #{car.color}"
  car.spray_paint("black")
  puts "Your car's color is #{car.color}"
  car.gas_mileage(100, 10)
  car.display_age
end
