def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when (sides.reduce(:+) - largest_side <= largest_side) || (sides.min <= 0)
    :invalid
  when sides.all? { |side| side == side1 }
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
