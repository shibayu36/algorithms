#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'balancedSums' function below.
#
# The function is expected to return a STRING.
# The function accepts INTEGER_ARRAY arr as parameter.
#

# def balancedSums(arr)
#   return 'YES' if arr.size == 1

#   left = 0
#   right = arr.size - 1
#   left_sum = 0
#   right_sum = 0

#   # WIP: when 3 elements, this returns YES every time
#   while left < right
#     if arr[left] == 0
#       left_sum += arr[left]
#       left += 1
#     elsif arr[right] == 0
#       right_sum += arr[right]
#       right -= 1
#     elsif left_sum <= right_sum
#       left_sum += arr[left]
#       left += 1
#     else
#       right_sum += arr[right]
#       right -= 1
#     end

#     # if right == left, the pointer is at the element that is possible to be balanced.
#     if right == left && left_sum == right_sum
#       return 'YES'
#     end
#   end

#   'NO'
# end

def balancedSums(arr)
  return 'YES' if arr.size == 1

  total = arr.sum
  left_sum = 0

  (0..arr.size - 1).each do |i|
    rest_sum = total - left_sum - (arr[i] || 0)
    if left_sum == rest_sum
      return 'YES'
    end

    left_sum += arr[i]
  end

  'NO'
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

T = gets.strip.to_i

T.times do |_t_itr|
  n = gets.strip.to_i

  arr = gets.rstrip.split.map(&:to_i)

  result = balancedSums arr

  fptr.write result
  fptr.write "\n"
end

fptr.close
