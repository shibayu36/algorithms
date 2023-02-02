require 'json'
require 'stringio'

#
# Complete the 'diagonalDifference' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

def diagonalDifference(arr)
  n = arr.length
  primary = (0..n - 1).reduce(0) do |sum, i|
    sum + arr[i][i]
  end
  secondary = (0..n - 1).reduce(0) do |sum, i|
    sum + arr[i][n - 1 - i]
  end
  (primary - secondary).abs
end

# p(diagonalDifference([[11, 2, 4], [4, 5, 6], [10, 8, -12]]))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

n = gets.strip.to_i

arr = Array.new(n)

n.times do |i|
  arr[i] = gets.rstrip.split.map(&:to_i)
end

result = diagonalDifference arr

fptr.write result
fptr.write "\n"

fptr.close
