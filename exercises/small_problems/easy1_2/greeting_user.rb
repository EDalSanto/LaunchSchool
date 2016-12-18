if __FILE__ == $0
  print "What is your name? "
  name = gets.chomp

  if name[-1] == '!'
    name = name[0...-1]
    puts "Hello #{name}. Why are we screaming?".upcase
  else
    puts "Hello #{name}."
  end

end
