file = File.open('text', 'r')
text = file.read
file.close
puts text.gsub('a', 'e')
