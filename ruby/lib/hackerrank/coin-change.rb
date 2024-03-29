require 'json'
require 'stringio'

#
# Complete the 'getWays' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. LONG_INTEGER_ARRAY c
#

def getWays(n, c)
  getWaysHelper(n, c, 0, {})
end

def getWaysHelper(n, c, index, memo)
  return 0 if n < 0 # no solution
  return 0 if c.size <= index # no solution
  return 1 if n == 0 # found solution

  memo[cacheKey(n - c[index], index)] ||= getWaysHelper(n - c[index], c, index, memo)
  memo[cacheKey(n, index + 1)] ||= getWaysHelper(n, c, index + 1, memo)

  memo[cacheKey(n - c[index], index)] + memo[cacheKey(n, index + 1)]
end

def cacheKey(n, index)
  "#{n}-#{index}"
end

puts(getWays(0, [1, 2]))
puts(getWays(1, []))
puts(getWays(1, [1, 2]))
puts(getWays(4, [1, 2, 3]))
puts(getWays(10, [2, 5, 3, 6]))

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

# first_multiple_input = gets.rstrip.split

# n = first_multiple_input[0].to_i

# m = first_multiple_input[1].to_i

# c = gets.rstrip.split.map(&:to_i)

# # Print the number of ways of making change for 'n' units using coins having the values given by 'c'

# ways = getWays n, c

# fptr.write ways
# fptr.write "\n"

# fptr.close
