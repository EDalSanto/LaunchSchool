def triangle2(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180 || angles.any? { |angle| angle <= 0 }
    :invalid
  when angles.one? { |angle| angle == 90 }
    :right
  when angles.one? { |angle| angle > 90 }
    :obtuse
  when angles.all? { |angle| angle < 90 }
    :acute
  end
end

puts triangle2(60, 70, 50) == :acute
puts triangle2(30, 90, 60) == :right
puts triangle2(120, 50, 10) == :obtuse
puts triangle2(0, 90, 90) == :invalid
puts triangle2(50, 50, 50) == :invalid
