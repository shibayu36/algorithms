#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'anagram' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def anagram(s)
  return -1 if s.length.odd?

  chars = s.chars

  pre_parts = Hash.new(0)
  chars[0..(chars.size / 2) - 1].each do |char|
    pre_parts[char] += 1
  end

  chars[(chars.size / 2)..-1].each do |char|
    pre_parts[char] -= 1
  end

  pre_parts.values.map { |num| num.abs }.sum / 2
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

q = gets.strip.to_i

q.times do |_q_itr|
  s = gets.chomp

  result = anagram s

  fptr.write result
  fptr.write "\n"
end

fptr.close
