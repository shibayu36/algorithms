#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'alternate' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def alternate(s)
  # Write your code here
  combination = make_combination(s.chars.uniq)

  max = 0
  combination.each do |a, b|
    target_chars = s.chars.filter { |c| c == a || c == b }
    if target_chars.each_cons(2).all? { |e1, e2| e1 != e2 }
      max = [max, target_chars.length].max
    end
  end

  max
end

def make_combination(arr)
  res = []
  (0..arr.size - 1).each do |i|
    (i + 1..arr.size - 1).each do |j|
      res.push([arr[i], arr[j]])
    end
  end
  res
end

# alternate('beabeefeab')

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

l = gets.strip.to_i

s = gets.chomp

result = alternate s

fptr.write result
fptr.write "\n"

fptr.close
