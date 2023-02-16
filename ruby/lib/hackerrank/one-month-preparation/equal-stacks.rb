#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'equalStacks' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY h1
#  2. INTEGER_ARRAY h2
#  3. INTEGER_ARRAY h3
#

def equalStacks(h1, h2, h3)
  stacks = [[h1, h1.sum], [h2, h2.sum], [h3, h3.sum]]
  target_stack = stacks.max_by { |_, sum| sum }

  until stacks.all? { |_, sum| sum == target_stack[1] }
    target_stack[1] -= target_stack[0].shift
    target_stack = stacks.max_by { |_, sum| sum }
  end

  stacks[0][1]
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

first_multiple_input = gets.rstrip.split

n1 = first_multiple_input[0].to_i

n2 = first_multiple_input[1].to_i

n3 = first_multiple_input[2].to_i

h1 = gets.rstrip.split.map(&:to_i)

h2 = gets.rstrip.split.map(&:to_i)

h3 = gets.rstrip.split.map(&:to_i)

result = equalStacks h1, h2, h3

fptr.write result
fptr.write "\n"

fptr.close
