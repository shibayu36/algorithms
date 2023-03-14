#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'caesarCipher' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING s
#  2. INTEGER k
#

def caesarCipher(s, k)
  s.chars.map do |c|
    if 65 <= c.ord && c.ord <= 90
      # A-Z
      code_point = ((c.ord - 65 + k) % 26) + 65
      code_point.chr
    elsif 97 <= c.ord && c.ord <= 122
      # a-z
      code_point = ((c.ord - 97 + k) % 26) + 97
      code_point.chr
    else
      c
    end
  end.join
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

n = gets.strip.to_i

s = gets.chomp

k = gets.strip.to_i

result = caesarCipher s, k

fptr.write result
fptr.write "\n"

fptr.close
