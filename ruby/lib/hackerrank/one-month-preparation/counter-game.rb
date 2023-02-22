#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'counterGame' function below.
#
# The function is expected to return a STRING.
# The function accepts LONG_INTEGER n as parameter.
#

def counterGame(n)
  # Write your code here
  pows = [1]
  pows.push(pows[-1] * 2) until pows[-1] >= n

  turn = 0

  until n == 1
    target_pow_i = pows.find_index { |p| p >= n }
    target_pow = pows[target_pow_i]
    if n == target_pow
      n /= 2
    else
      n -= pows[target_pow_i - 1]
    end

    turn += 1
  end

  turn.odd? ? 'Louise' : 'Richard'
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

t = gets.strip.to_i

t.times do |_t_itr|
  n = gets.strip.to_i

  result = counterGame n

  fptr.write result
  fptr.write "\n"
end

fptr.close
