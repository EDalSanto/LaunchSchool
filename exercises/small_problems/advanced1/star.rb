def print_top(width, max_gap)
  max_gap.downto(0) do |gap_size|
    puts Array.new(3, '*').join(' ' * gap_size).center(width)
  end
end

def print_bottom(width, max_gap)
  0.upto(max_gap) do |gap_size|
    puts Array.new(3, '*').join(' ' * gap_size).center(width)
  end
end

def star(width)
  max_gap = (width - 3) / 2
  print_top(width, max_gap)
  puts "*" * width
  print_bottom(width, max_gap)
end

star(21)
