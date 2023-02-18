#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'maxMin' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY arr
#

def maxMin(k, arr)
  arr.sort!

  min = Float::INFINITY
  (0..arr.size - k).each do |i|
    current_unfairness = arr[i + k - 1] - arr[i]
    min = [min, current_unfairness].min
  end

  min
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

n = gets.strip.to_i

k = gets.strip.to_i

arr = Array.new(n)

n.times do |i|
  arr_item = gets.strip.to_i
  arr[i] = arr_item
end

result = maxMin k, arr

fptr.write result
fptr.write "\n"

fptr.close
