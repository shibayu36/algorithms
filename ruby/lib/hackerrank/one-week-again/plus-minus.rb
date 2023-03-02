#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def plusMinus(arr)
  list = [0, 0, 0]
  arr.each do |n|
    if n > 0
      list[0] += 1
    elsif n < 0
      list[1] += 1
    else
      list[2] += 1
    end
  end

  sum = list.sum
  puts(format('%.6f', list[0].to_f / sum))
  puts(format('%.6f', list[1].to_f / sum))
  puts(format('%.6f', list[2].to_f / sum))
end

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

plusMinus arr
