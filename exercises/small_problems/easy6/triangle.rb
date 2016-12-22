def triangle(n)
  (1..n).to_a.each do |stars_to_print|
    spaces_to_print = n - stars_to_print 
    puts ' ' * spaces_to_print + '*' * stars_to_print 
  end
end

triangle(5)
triangle(9)
