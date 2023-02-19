#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'arrayManipulation' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#

def arrayManipulation(n, queries)
  arr = Array.new(n + 2, 0)

  queries.each do |a, b, k|
    arr[a] += k
    arr[b + 1] -= k
  end

  max_sum = 0
  sum = 0
  arr.filter { |diff| diff != 0 }.each do |diff|
    sum += diff
    max_sum = [max_sum, sum].max
  end

  max_sum
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

m = first_multiple_input[1].to_i

queries = Array.new(m)

m.times do |i|
  queries[i] = gets.rstrip.split.map(&:to_i)
end

result = arrayManipulation n, queries

fptr.write result
fptr.write "\n"

fptr.close
