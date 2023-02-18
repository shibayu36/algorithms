#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'getTotalX' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER_ARRAY b
#

def getTotalX(a, b)
  # Write your code here
  elements = []
  a[-1].upto(b[0]).each do |num|
    if a.all? { |n| num % n == 0 }
      elements << num
    end
  end

  answers = []
  elements.each do |num|
    if b.all? { |n| n % num == 0 }
      answers << num
    end
  end

  answers.size
end

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
fptr = $stdout

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

m = first_multiple_input[1].to_i

arr = gets.rstrip.split.map(&:to_i)

brr = gets.rstrip.split.map(&:to_i)

total = getTotalX arr, brr

fptr.write total
fptr.write "\n"

fptr.close
