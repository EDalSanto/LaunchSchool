def uuid
  chars = ('0'..'9').to_a  + ('a'..'f').to_a
  res = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |size, index|
    size.times do 
      res += chars.sample 
    end
    res += '-' unless index == sections.length - 1
  end
  res
end

p uuid
