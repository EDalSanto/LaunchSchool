def get_grade(one, two, three)
  res = (one + two + three) / 3

  case res
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
  
end
