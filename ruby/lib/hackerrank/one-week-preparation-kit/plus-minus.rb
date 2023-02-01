require 'json'
require 'stringio'

#
# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def plusMinus(arr, n)
  result = [0, 0, 0]
  arr.each do |num|
    if num > 0
      result[0] += 1
    elsif num < 0
      result[1] += 1
    else
      result[2] += 1
    end
  end

  puts(format('%.6f', result[0].to_f / n))
  puts(format('%.6f', result[1].to_f / n))
  puts(format('%.6f', result[2].to_f / n))
end

n = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

plusMinus(arr, n)
