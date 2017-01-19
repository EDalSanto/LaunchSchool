sentence = "Humpty Dumpty sat on a wall."
puts "Sentence: #{sentence}"
backwards_sentence = sentence.split(/\W/).reverse.join(' ') + '.'
puts "Backwards Sentence: #{backwards_sentence}"
