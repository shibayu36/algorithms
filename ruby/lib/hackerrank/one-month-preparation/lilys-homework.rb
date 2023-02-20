#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'lilysHomework' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#

def count_swaps(arr, sorted)
  expected_map = {}
  sorted.map.with_index do |v, i|
    expected_map[v] = i
  end

  i = 0
  swap = 0
  while i < arr.size
    expected_pos = expected_map[arr[i]]

    if i == expected_map[arr[i]]
      i += 1
      next
    end

    arr[i], arr[expected_pos] = arr[expected_pos], arr[i]
    swap += 1
  end

  swap
end

def lilysHomework(arr)
  [
    count_swaps(arr.dup, arr.sort),
    count_swaps(arr.dup, arr.sort { |a, b| b <=> a })
  ].min
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

result = lilysHomework arr

fptr.write result
fptr.write "\n"

fptr.close
