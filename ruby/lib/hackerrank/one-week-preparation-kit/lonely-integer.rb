require 'json'
require 'stringio'

#
# Complete the 'lonelyinteger' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY a as parameter.
#

def lonelyinteger(a)
  res = Hash.new { |h, k| h[k] = 0 }

  a.each do |num|
    res[num] += 1
  end

  res.keys.find { |k| res[k] == 1 }
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

n = gets.strip.to_i

a = gets.rstrip.split.map(&:to_i)

result = lonelyinteger a

fptr.write result
fptr.write "\n"

fptr.close
