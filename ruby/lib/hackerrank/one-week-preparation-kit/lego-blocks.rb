require 'json'
require 'stringio'

#
# Complete the 'legoBlocks' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER m
#

def legoLineNum(m, memo = {})
  return 0 if m < 0
  return 1 if m == 0
  return memo[m] if memo.has_key?(m)

  memo[m] =
    legoLineNum(m - 1, memo) + legoLineNum(m - 2, memo) + legoLineNum(m - 3, memo) + legoLineNum(m - 4, memo)
end

def legoBlocks(n, m)
  # Write your code here
end

puts(legoLineNum(1))
puts(legoLineNum(2))
puts(legoLineNum(3))
puts(legoLineNum(4))

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

# t = gets.strip.to_i

# t.times do |_t_itr|
#   first_multiple_input = gets.rstrip.split

#   n = first_multiple_input[0].to_i

#   m = first_multiple_input[1].to_i

#   result = legoBlocks n, m

#   fptr.write result
#   fptr.write "\n"
# end

# fptr.close
