#!/bin/ruby

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

# Wrong... we cannot use dp model because we can select the same coin multiple times
# def getWays(n, c)
#   # dp[i, sum]
#   dp = Array.new(c.size + 1) { Array.new(n + 1, 0) }
#   dp[0][0] = 1
#   # (1..n).each do |sum|
#   #   dp[0][sum] = 0
#   # end

#   (0..c.size - 1).each do |i|
#     (0..n).each do |sum|
#       # not select
#       dp[i + 1][sum] += dp[i][sum]

#       # select
#       if sum >= c[i]
#         dp[i + 1][sum] += dp[i][sum - c[i]]
#       end
#     end
#   end

#   dp[c.size][n]
# end

def getWays(n, c, memo = {})
  return memo[[n, c]] if memo[[n, c]]
  return 1 if n == 0 && c.size == 0
  return 0 if n < 0 || c.size == 0

  selected = getWays(n - c[0], c, memo)
  not_selected = getWays(n, c[1..], memo)

  memo[[n, c]] = selected + not_selected
end

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
fptr = $stdout

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

m = first_multiple_input[1].to_i

c = gets.rstrip.split.map(&:to_i)

# Print the number of ways of making change for 'n' units using coins having the values given by 'c'

ways = getWays n, c

fptr.write ways
fptr.write "\n"

fptr.close
