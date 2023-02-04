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
    if code >= 65 && code <= 90
      (((code - 65 + k) % 26) + 65).chr
    elsif code >= 97 && code <= 122
      (((code - 97 + k) % 26) + 97).chr
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
