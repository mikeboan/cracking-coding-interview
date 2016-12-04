# for matrix[r][c] == 0, set all elements in row and col to zero
#
def zero_matrix(matrix)
  zero_rows = []
  zero_cols = []

  matrix.each_index do |row|
    matrix[row].each_index do |col|
      if matrix[row][col] == 0
        zero_rows << row
        zero_cols << col
      end
    end
  end

  zero_rows.each do |row|
    matrix[row].each_index do |col|
      matrix[row][col] = 0
    end
  end

  zero_cols.each do |col|
    matrix.each_index do |row|
      matrix[row][col] = 0
    end
  end

  matrix
end

mat1 = [
  [1, 2, 3, 4],
  [1, 0, 3, 1]
]

mat1soln = [
  [1, 0, 3, 4],
  [0, 0, 0, 0]
]

puts zero_matrix(mat1) == mat1soln
