#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'isBalanced' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def isBalanced(s)
  stack = []
  match = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }
  opens = match.keys

  s.chars.each do |c|
    if opens.include?(c)
      stack.push(c)
    else
      expected = match[stack.pop]
      return 'NO' if c != expected
    end
  end

  stack.empty? ? 'YES' : 'NO'
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

t = gets.strip.to_i

t.times do |_t_itr|
  s = gets.chomp

  result = isBalanced s

  fptr.write result
  fptr.write "\n"
end

fptr.close
