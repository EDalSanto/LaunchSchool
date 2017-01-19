munsters = 
{
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "make" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

puts "munsters before:\n#{munsters}"

munsters.each do |munster, info|
  if info["age"] >= 0 && info["age"] <= 17
    info["age_group"] = "kid"
  elsif info["age"] >= 18 && info["age"] <= 64 
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end

puts "munsters after:\n#{munsters}"

#or

munsters.each do |munster, info|
  case
  when 0...18
    info["age_group"] = "kid"
  when 18...65
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end
