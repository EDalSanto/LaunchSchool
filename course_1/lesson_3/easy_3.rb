#1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#2
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
#3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
#4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(/^(.*?)(?=house)/)
#or
advice.slice!(0, advice.index('house'))
#5
statement = "The Flintstones Rock!"
statement.count "t"
#6
title = "Flintstone Family Members"
title.center(40)
