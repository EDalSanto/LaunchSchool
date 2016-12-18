#def num_chars(words)
#  chars = 0
#  words.chars.each do |c| 
#    if c =~ /[[:alpha:]]/ || c =~ /[[:punct:]]/ 
#      chars += 1
#    end
#  end
#  chars
#end

if __FILE__ == $0
  print "Please write word or multiple words: " 
  words = gets.chomp
  num_chars = words.delete(' ').size
  puts "There are #{num_chars} characters in #{words}."
end
