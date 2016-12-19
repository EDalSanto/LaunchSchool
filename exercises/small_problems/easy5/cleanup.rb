# parse string chars and add to result as necessary

def cleanup(str)
  clean_str = ''
  str.chars.each do |c|
    if !(c =~ /[[:alpha:]]/) 
      clean_str += ' ' if clean_str[-1] != ' '
    else
      clean_str += c
    end
  end
  clean_str
end

def cleanup2(str)
  str.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
