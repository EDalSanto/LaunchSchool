require 'sequel'

DB = Sequel.connect("postgres://localhost/sequel-single-table")
menu_items = DB[:menu_items]

menu_items.each do |menu_item|
  puts "#{menu_item[:item]}"
  puts "menu price: #{menu_item[:menu_price]}"
  puts "ingredient cost: #{menu_item[:ingredient_cost]}"
  puts "labor: #{menu_item[:prep_time] / 60 * 12}"
  puts "profit: #{}"
end
