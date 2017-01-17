require 'pry'
#arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
#puts arr1[2][1][-1] == 'g'
#
#arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
#puts arr2[1][:third][0] == 'g'
#
#arr3 = [['abc'], ['def'], {third: ['ghi']}]
#puts arr3[2][:third][0][0] == 'g'
#
#hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
#puts hsh1['b'][1] == 'g'
#
#hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
#puts hsh2[:third].key(0) == 'g'
#

#arr1 = [1, [2, 3], 4]
#arr1[1][1] = 4
#p arr1

#arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
#arr2[2] = 4
#p arr2

#hsh1 = {first: [1, 2, [3]]}
#hsh1[:first][2][0] = 4
#p hsh1

#hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
#hsh2[['a']][:a][2] = 4
#p hsh2
#

#hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
#
#hsh.values.each do |word_arr|
#  word_arr.each do |word|
#    word.chars.each { |c| puts c if c =~ /[aeiou]/ }
#  end
#end
#

# new array -> map
# sort each inner array and return to new map array
#
#arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#r = arr.map do |inner_arr|
#  inner_arr.sort { |x, y| y <=> x }
#end
#
#p r
#
#

#arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
#r = arr.map do |hash|
#  incr = {}
#  hash.each do |k,v|
#    incr[k] = v + 1
#  end
#  incr
#end
#
#p r
#
#

# multiples of 3: n % 3 == 0
# same structure
#arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
#r = arr.map do |inner_arr|
#  inner_arr.select { |num| num % 3 == 0 }
#end
#
#p r
#

# return hash where: key is the first item in each sub array, value second
#arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
#h = {}
#arr.each do |inner_arr|
#  h[inner_arr[0]] = inner_arr[1]
#end
#
#p h

#arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
#r = arr.sort_by do |inner_arr|
#  inner_arr.select do |num|
#    num.odd?
#  end
#end
#
#p r
#
#

#hsh = {
#  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
#}

# return arr, colors of fruits(value[:type]) 
#
#arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
## each element in array is hash
## select from each element of array hash with all evens
## hash
#r = arr.select do |hash|
#  hash.all? do |_,v|
#    v.all? do |n| 
#      n.even?
#    end
#  end
#end

#p r
#
#

