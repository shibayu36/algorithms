require 'json'
require 'stringio'

#
# Complete the 'twoArrays' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY A
#  3. INTEGER_ARRAY B
#

def twoArrays(k, a, b)
  # Write your code here
  a.sort!
  b.sort!.reverse!

  a.zip(b).each do |a_val, b_val|
    return 'NO' if a_val + b_val < k
  end

  'YES'
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

q = gets.strip.to_i

q.times do |_q_itr|
  first_multiple_input = gets.rstrip.split

  n = first_multiple_input[0].to_i

  k = first_multiple_input[1].to_i

  a = gets.rstrip.split.map(&:to_i)

  b = gets.rstrip.split.map(&:to_i)

  result = twoArrays k, a, b

  fptr.write result
  fptr.write "\n"
end

fptr.close
