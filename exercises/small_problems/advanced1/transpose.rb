def transpose(matrix)
  rows = matrix.length
  cols = matrix[0].length
  transposed_matrix = [] 
  cols.times do |c| 
    new_inner_arr = []
    rows.times do |r|
      new_inner_arr << matrix[r][c]
    end
    transposed_matrix << new_inner_arr
  end
  transposed_matrix
end

if __FILE__ == $0
  puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
  puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
  puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
  puts transpose([[1]]) == [[1]]
end
