#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'pageCount' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER p
#

def pageCount(n, p)
  from_front = p / 2
  from_back = ((n.odd? ? n : n + 1) - p) / 2
  [from_front, from_back].min
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

n = gets.strip.to_i

p = gets.strip.to_i

result = pageCount n, p

fptr.write result
fptr.write "\n"

fptr.close
