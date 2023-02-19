#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'highestValuePalindrome' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING s
#  2. INTEGER n
#  3. INTEGER k
#

def highestValuePalindrome(s, n, k)
  changed = Array.new(n)

  start = 0
  finish = n - 1

  while start < finish
    if s[start] != s[finish]
      return -1 if k == 0

      if s[start].to_i > s[finish].to_i
        s[finish] = s[start]
      else
        s[start] = s[finish]
      end

      k -= 1
      changed[start] = true
    end

    start += 1
    finish -= 1
  end

  start = 0
  finish = n - 1

  while start <= finish && k > 0
    if s[start] == '9'
      start += 1
      finish -= 1
      next
    end

    if changed[start]
      s[start] = s[finish] = '9'
      k -= 1
    elsif start == finish
      s[start] = '9'
      k -= 1
    elsif k >= 2
      s[start] = s[finish] = '9'
      k -= 2
    end

    start += 1
    finish -= 1
  end

  s
end

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
fptr = $stdout

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

s = gets.chomp

result = highestValuePalindrome s, n, k

fptr.write result
fptr.write "\n"

fptr.close
