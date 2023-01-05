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
  # Write your code here
  getRawWays(n, c).tap { |ways| p(ways) }.size
end

def getRawWays(n, c)
  return [] if n <= 0
  return [] if c.size == 0

  result = []
  c.each do |coin|
    ways = getRawWays(n - coin, c)
    next if ways.empty?

    result << ways.map { |way| coin.concat(way) }
  end
  result
end

puts(getWays(0, [1, 2]))
puts(getWays(1, []))

# first_multiple_input = gets.rstrip.split

# n = first_multiple_input[0].to_i

# m = first_multiple_input[1].to_i

# c = gets.rstrip.split.map(&:to_i)

# # Print the number of ways of making change for 'n' units using coins having the values given by 'c'

# ways = getWays n, c
# puts(ways)

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

# fptr.write ways
# fptr.write "\n"

# fptr.close
