def permutations(arr)
  return [arr] if arr.size == 1

  res = []
  arr.each_with_index do |n, index|
    sub_array = arr[0...index] + arr[(index + 1)..-1]
    sub_permutations = permutations(sub_array)
    sub_permutations.each do |sub_perm|
      res << [n] + sub_perm
    end
  end
  res
end

p permutations([2])
# -> [[2]]

p permutations([1, 2])
# -> [[1, 2], [2, 1]]

p permutations([1, 2, 3])
# -> [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

p permutations([1, 2, 3, 4])
# -> [[1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4],
#     [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2],
#     [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4],
#     [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1],
#     [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4],
#     [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1],
#     [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3],
#     [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]]
