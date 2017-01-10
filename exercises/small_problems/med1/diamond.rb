# number n represents center width of diamond
# each subequent row decreases it's width by 2, 1 on each side
# offset/spaces = n / 2
# print top
# print center

def print_row(grid_size, distance_from_center)
  stars = grid_size - (2 * distance_from_center)

  print " " * distance_from_center
  puts "*" * stars
end

def diamond(grid_size)
  max_distance = grid_size / 2  

  max_distance.downto(0) { |distance_from_center| print_row(grid_size, distance_from_center) }
  1.upto(max_distance) { |distance_from_center| print_row(grid_size, distance_from_center) }

end

diamond(1)
diamond(3)
diamond(9)
