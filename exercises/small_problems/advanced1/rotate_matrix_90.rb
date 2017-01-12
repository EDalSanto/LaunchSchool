require_relative 'transpose'

def rotate90(matrix)
  transposed = transpose(matrix)
  transposed.each do |inner_arr|
    inner_arr.reverse!
  end
  transposed
end

def rotate(matrix, degrees)
  rotations = degrees / 90
  rotations.times do
    matrix = rotate90(matrix)
  end
  matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
  [4, 5, 0]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate(matrix1, 180)

p new_matrix1 == [[0, 5, 4], [6, 9, 3], [2, 7, 4], [8, 5, 1]]
