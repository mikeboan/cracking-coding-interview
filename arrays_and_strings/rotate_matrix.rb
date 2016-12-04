require 'byebug'
# rotate NxN matrix in-place
#
def rotate_matrix(matrix)
  return matrix if matrix.length == 1

  (matrix.length / 2.0).ceil.times do |layer|
    rotate_layer(matrix, layer)
  end
  matrix
end

# return array of 4-way swap locations given row and col of first
#   location and length of the square matrix
def swap_locations(row, col, length, layer)
  # [
  #   [row, col],
  #   [col, length - 1 + layer],
  #   [length - 1 + layer, length - 1 - col],
  #   [length - 1 - col, row]
  # ]

end

def four_way_swap(matrix, locations)
  p locations
  temp = matrix[locations[0][0]][locations[0][1]]
  (0..2).each do |loc|
    matrix[locations[loc][0]][locations[loc][1]] =
      matrix[locations[loc + 1][0]][locations[loc + 1][1]]
  end
  # debugger
  matrix[locations[3][0]][locations[3][1]] = temp
end

def render_matrix(matrix)
  matrix.each do |row|
    p row
  end
end

def rotate_layer(matrix, layer)
  layer_length = matrix.length - (2 * layer)
  (layer_length - 1).times do |d_col|
    # debugger
    four_way_swap(
      matrix,
      swap_locations(layer, layer + d_col, layer_length, layer)
    )
  end
end

mat1 = [[10]]
mat2 = [
  [10, 11],
  [20, 21]
]
mat3 = [
  [10, 11, 12],
  [20, 21, 22],
  [30, 31, 32]
]
mat4 = [
  [10, 11, 12, 13],
  [20, 21, 22, 23],
  [30, 31, 32, 33],
  [40, 41, 42, 43]
]
mat5 = [
  [10, 11, 12, 13, 14],
  [20, 21, 22, 23, 24],
  [30, 31, 32, 33, 34],
  [40, 41, 42, 43, 44],
  [50, 51, 52, 53, 54]
]

matrix = mat5
render_matrix matrix
rotate_matrix(matrix)
puts
render_matrix matrix






=begin
Layer = 0, length = 5

(length - 1).times do |n|
  partners.push(
    [layer, length - 1],
    [length - 1, length - 1 - n],
    [length - 1 - n, layer]
  )
end

  0,0 -> 0,4 -> 4,4 -> 4,0
  0,1 -> 1,4 -> 4,3 -> 3,0
  0,2 -> 2,4 -> 4,2 -> 2,0
  0,3 -> 3,4 -> 4,1 -> 1,0
  R,C -> C,len-1 -> len-1, len-1-C -> l-1-C, R
  R == Layer???

Layer = 1, length = 3
  1,1 -> 1,3 -> 3,3 -> 3,1
  1,2 -> 2,3 -> 3,2 -> 2,1

  R,C -> C,len-1+layer -> len-1+layer, len-1-C+layer -> l-1-C, R
  1,1 -> 1,3 -> 3,1 -> 1,1

  R,C =>
=end
