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
    code = c.ord
    if 'a' <= c && c <= 'z'
      (((c.ord - 'a'.ord + k) % 26) + 'a'.ord).chr
    elsif 'A' <= c && c <= 'Z'
      (((c.ord - 'A'.ord + k) % 26) + 'A'.ord).chr
    else
      c
    end
  end.join
end

# puts(caesarCipher('middle-Outz', 2))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

n = gets.strip.to_i

s = gets.chomp

k = gets.strip.to_i

result = caesarCipher s, k

fptr.write result
fptr.write "\n"

fptr.close
