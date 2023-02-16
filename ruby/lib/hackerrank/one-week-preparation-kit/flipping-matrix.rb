require 'json'
require 'stringio'

#
# Complete the 'flippingMatrix' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY matrix as parameter.
#

def flippingMatrix(matrix)
  size = matrix.size
  n = size / 2

  sum = 0
  (0..n - 1).each do |i|
    (0..n - 1).each do |j|
      max = [matrix[i][j], matrix[i][size - j - 1], matrix[size - i - 1][j], matrix[size - i - 1][size - j - 1]].max
      sum += max
    end
  end

  sum
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

q = gets.strip.to_i

q.times do |_q_itr|
  n = gets.strip.to_i

  matrix = Array.new(2 * n)

  (2 * n).times do |i|
    matrix[i] = gets.rstrip.split.map(&:to_i)
  end

  result = flippingMatrix matrix

  fptr.write result
  fptr.write "\n"
end

fptr.close
