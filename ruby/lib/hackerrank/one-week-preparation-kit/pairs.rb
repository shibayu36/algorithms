require 'json'
require 'stringio'
require 'set'

#
# Complete the 'pairs' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY arr
#

def pairs(k, arr)
  # set = Set.new(arr)
  set = arr.to_h { |num| [num, true] }

  result = 0
  arr.each do |num|
    target = num + k
    if set.include?(target)
      result += 1
    end
  end

  result
end

# puts(pairs(2, [1, 5, 3, 4, 2]))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

arr = gets.rstrip.split.map(&:to_i)

result = pairs k, arr

fptr.write result
fptr.write "\n"

fptr.close
