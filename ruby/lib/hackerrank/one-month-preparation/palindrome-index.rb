#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'palindromeIndex' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def palindromeIndex(s)
  chars = s.chars
  start = 0
  finish = chars.size - 1

  until start > finish
    if chars[start] == chars[finish]
      start += 1
      finish -= 1
      next
    else
      if palindrome?(chars[start + 1..finish])
        return start
      elsif palindrome?(chars[start..finish - 1])
        return finish
      else
        return -1
      end
    end
  end

  -1
end

def palindrome?(s)
  s == s.reverse
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

q = gets.strip.to_i

q.times do |_q_itr|
  s = gets.chomp

  result = palindromeIndex s

  fptr.write result
  fptr.write "\n"
end

fptr.close
