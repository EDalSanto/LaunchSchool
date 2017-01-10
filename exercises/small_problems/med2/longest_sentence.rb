if __FILE__ == $0

  file_name = ARGV.first
  txt = File.read(file_name)
  sentences = txt.split(/\n\n/)
  largest_paragraph = sentences.max_by { |sen| sen.split.size }
  largest_paragraph = largest_paragraph.strip
  number_of_words = largest_paragraph.split.size
 
  puts "#{largest_paragraph}"
  puts "Containing #{number_of_words} words"

end
