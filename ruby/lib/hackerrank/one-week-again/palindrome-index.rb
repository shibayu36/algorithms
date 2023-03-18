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
  left = 0
  right = s.length - 1

  while left < right
    if s[left] == s[right]
      left += 1
      right -= 1
      next
    end

    if palindrome?(s[left + 1..right])
      return left
    elsif palindrome?(s[left..right - 1])
      return right
    else
      return -1
    end
  end

  -1
end

def palindrome?(s)
  s == s.reverse
end

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
fptr = $stdout

q = gets.strip.to_i

q.times do |_q_itr|
  s = gets.chomp

  result = palindromeIndex s

  fptr.write result
  fptr.write "\n"
end

fptr.close
