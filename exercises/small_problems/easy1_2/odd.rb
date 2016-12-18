def is_odd?(num)
  num.remainder(2).abs == 1
end

# tests
puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
