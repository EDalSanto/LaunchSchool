module Maintenance
  def change_tires
    "Changing #{Vehicle::WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance

  def initialize
    puts "#{WHEELS} wheels in this car!"
  end
end

a_car = Car.new
a_car.change_tires
