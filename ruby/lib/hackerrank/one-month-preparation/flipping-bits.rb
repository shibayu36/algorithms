require 'json'
require 'stringio'

#
# Complete the 'flippingBits' function below.
#
# The function is expected to return a LONG_INTEGER.
# The function accepts LONG_INTEGER n as parameter.
#

def flippingBits(n)
  # Write your code here
  n ^ 4_294_967_295
end

# puts(flippingBits(2_147_483_647))
# puts(flippingBits(1))
# puts(flippingBits(0))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

q = gets.strip.to_i

q.times do |_q_itr|
  n = gets.strip.to_i

  result = flippingBits n

  fptr.write result
  fptr.write "\n"
end

fptr.close
