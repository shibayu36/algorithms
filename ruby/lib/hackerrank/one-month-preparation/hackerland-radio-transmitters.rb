#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'hackerlandRadioTransmitters' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY x
#  2. INTEGER k
#

def hackerlandRadioTransmitters(x, k)
  # Write your code here
  # sort
  x.sort!

  count = 0
  until x.empty?
    current_location = x.shift

    target_house = current_location
    while x[0] && x[0] <= current_location + k
      target_house = x.shift
    end

    covered = target_house + k
    while x[0] && x[0] <= target_house + k
      x.shift
    end

    count += 1
  end

  count
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

x = gets.rstrip.split.map(&:to_i)

result = hackerlandRadioTransmitters x, k

fptr.write result
fptr.write "\n"

fptr.close
