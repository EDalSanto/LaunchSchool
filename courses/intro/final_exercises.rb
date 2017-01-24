# Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each { |num| puts num }

# Same as above, but only print out values greater than 5.
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each { |num| puts num if num > 5 }

# Now, using the same array from #2, use the select method to extract all odd numbers into a new array.
# odds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select { |num| num % 2 != 0 }
# p odds

# Append "11" to the end of the original array. Prepend "0" to the beginning.
# p [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].push(11).unshift(0)

# Get rid of "11". And append a "3".
# arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].push(3)
# arr.delete(11)
# p arr
#
# # Get rid of duplicates without specifically removing any one value.
# p arr.uniq!

# What's the major difference between an Array and a Hash?
# An array is a sequence of elements which you retrieve by their index(they're associated to their index if you will)
# A hash associates keys to values to form a collection of key-value pairs

# Create a Hash using both Ruby syntax styles.
# hash1 = { some_key: "some value" }
# hash2 = { :some_key=>"some value" }
# p hash1
# p hash2

# Suppose you have a hash h = {a:1, b:2, c:3, d:4}
#
# 1. Get the value of key `:b`. # h[:b]
#
# 2. Add to this hash the key:value pair `{e:5}` # h[:e] = 5
#
# 3. Remove all key:value pairs whose value is less than 3.5 # h.select! { |key,val| val > 3.5 }

# Can hash values be arrays? Can you have an array of hashes? (give examples)
# Yes and yes
# hash = { names: ['john', 'mary'] }
# array_of_hashes = [{ names: ['john', 'mary'] }]
#
# Look at several Rails/Ruby online API sources and say which one you like best and why.
# I like ruby-doc.org because it seems the most throurough and if full of examples

# Given the following data structures. Write a program that moves the information from the array into the empty hash that applies to the correct person.

# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
#
# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
#
# contacts["Joe Smith"][:email] = contact_data[0][0]
# contacts["Joe Smith"][:address] = contact_data[0][1]
# contacts["Joe Smith"][:phone] = contact_data[0][2]
# contacts["Sally Johnson"][:email] = contact_data[1][0]
# contacts["Sally Johnson"][:address] = contact_data[1][1]
# contacts["Sally Johnson"][:phone] = contact_data[1][2]
#
# # Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number?
# puts "Joe's email is: #{contacts["Joe Smith"][:email]}"
# puts "Sally's phone is: #{contacts["Sally Johnson"][:phone]}"

# In exercise 12, we manually set the contacts hash values one by one. Now, programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array. Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

#
# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
#
# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
# fields = [:email, :address, :phone]
#
# contacts.each_with_index do |(contact,vals),idx|
#   fields.each do |field|
#     vals[field] = contact_data[idx].shift
#   end
# end
#
# p contacts

# Use Ruby's Array method delete_if and String method start_with? to delete all of the words that begin with an "s" in the following array.

# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
# arr.delete_if { |word| word.start_with?('s' )}
# p arr == ["winter", "ice", "white trees"]
# # Then recreate the arr and get rid of all of the words that start with "s" or starts with "w".
# arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
# arr.delete_if { |word| word.start_with?('s','w')}
# p arr == ["ice"]

# Take the following array:

# a = ['white snow', 'winter wonderland', 'melting ice',
#      'slippery sidewalk', 'salted roads', 'white trees']
# #
# # and turn it into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method.
#
# a.map! { |string| string.split(' ') }
# flat_a = a.flatten
# p flat_a

# # What will the following program output?
#
# hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
# hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}
#
# if hash1 == hash2
#   puts "These hashes are the same!"
# else
#   puts "These hashes are not the same!"
# end

# These hashes are the same!
