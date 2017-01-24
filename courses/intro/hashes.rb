# # Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only immediate family members' names into a new array.
#
# # Given
# #
# # family = {  uncles: ["bob", "joe", "steve"],
# #             sisters: ["jane", "jill", "beth"],
# #             brothers: ["frank","rob","david"],
# #             aunts: ["mary","sally","susan"]
# #           }
# # immediate_fam = family.select { |k,v| k == :sisters || k == :brothers }
# # immediate_fam = immediate_fam.values.flatten
# # p immediate_fam
#
# # Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.
#
# # merge! is destructive, it changes the original array, whereas merge produces a new array and maintains the old array
#
# # h1 = { NewYork: "East Coast", SanFrancisco: "West Coast", Austin: "SouthWest" }
# # h2 = { Boston: "East Coast", LosAngeles: "West Coast", Chicago: "Midwest" }
# # # h1.merge(h2) => {:NewYork=>"East Coast", :SanFrancisco=>"West Coast", :Austin=>"SouthWest", :Boston=>"East Coast", :LosAngeles=>", West Coast", :Chicago=>"Midwest"}
# # # h1 => { NewYork: "East Coast", SanFrancisco: "West Coast", Austin: "SouthWest" }
# # # h2 => { Boston: "East Coast", LosAngeles: "West Coast", Chicago: "Midwest" }
# #
# # h1.merge!(h2) => {:NewYork=>"East Coast", :SanFrancisco=>"West Coast", :Austin=>"SouthWest", :Boston=>"East Coast", :LosAngeles=>", West Coast", :Chicago=>"Midwest"}
# # p h1 => {:NewYork=>"East Coast", :SanFrancisco=>"West Coast", :Austin=>"SouthWest", :Boston=>"East Coast", :LosAngeles=>", West Coast", :Chicago=>"Midwest"}
# # p h2 => { Boston: "East Coast", LosAngeles: "West Coast", Chicago: "Midwest" }
#
# # Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.
#
# # cities = {:NewYork=>"East Coast", :SanFrancisco=>"West Coast", :Austin=>"SouthWest", :Boston=>"East Coast", :LosAngeles=>", West Coast", :Chicago=>"Midwest"}
# # cities.each { |city, coast| p city }
# # cities.each { |city, coast| p coast }
# # cities.each { |city, coast| p "#{city}->#{coast}" }
# #
# # Given the following expression, how would you access the name of the person?
# # person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
# # p person[:name]
#
# # What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.
# # cities = {:NewYork=>"East Coast", :SanFrancisco=>"West Coast", :Austin=>"SouthWest", :Boston=>"East Coast", :LosAngeles=>", West Coast", :Chicago=>"Midwest"}
# # p cities.values.include?("Artic") # false
# # p cities.values.include?("East Coast") # true
#
# # Given the array...
#
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
#
# # Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:
#
# # ["demo", "dome", "mode"]
# # ["neon", "none"]
# #
# # h = {}
# #
# # words.each do |word|
# #   sorted_letters = word.split('').sort.join
# #   if h.keys.include?(sorted_letters)
# #     h[sorted_letters].push(word)
# #   else
# #     h[sorted_letters] = [word]
# #   end
# # end
# #
# # h.values.each { |anagrams| p anagrams }
#
# # Given the following code...
#
# # x = "hi there"
# # my_hash = {x: "some value"}
# # my_hash2 = {x => "some value"}
# # What's the difference between the two hashes that were created?
# # The first hash created used the symbol x as the key. They second hash used the string value for x as the key
#
# If you see this error, what do you suspect is the most likely problem? # B
#
# NoMethodError: undefined method `keys' for Array
#
# A. We're missing keys in an array variable.
#
# B. There is no method called keys for Array objects.
#
# C. keys is an Array object, but it hasn't been defined yet.
#
# D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.
