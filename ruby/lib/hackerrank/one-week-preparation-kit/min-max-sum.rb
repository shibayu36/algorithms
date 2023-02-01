# frozen_string_literal: true

require 'json'
require 'stringio'

#
# Complete the 'miniMaxSum' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def miniMaxSum(arr)
  allSum = arr.sum

  maxNum = -Float::INFINITY
  minNum = Float::INFINITY
  arr.each do |num|
    currentSum = allSum - num
    maxNum = currentSum if currentSum > maxNum
    minNum = currentSum if currentSum < minNum
  end

  puts("#{minNum} #{maxNum}")
end

arr = gets.rstrip.split.map(&:to_i)

miniMaxSum arr
