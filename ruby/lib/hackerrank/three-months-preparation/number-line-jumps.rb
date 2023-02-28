#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'kangaroo' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. INTEGER x1
#  2. INTEGER v1
#  3. INTEGER x2
#  4. INTEGER v2
#

def kangaroo(x1, v1, x2, v2)
  v_delta = v1 - v2
  x_delta = x1 - x2

  if v_delta == 0 || (x_delta / v_delta) > 0
    # If one has bigger v and x, after cannot catch up
    return 'NO'
  end

  x_delta % v_delta == 0 ? 'YES' : 'NO'
end

# fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
fptr = $stdout

first_multiple_input = gets.rstrip.split

x1 = first_multiple_input[0].to_i

v1 = first_multiple_input[1].to_i

x2 = first_multiple_input[2].to_i

v2 = first_multiple_input[3].to_i

result = kangaroo x1, v1, x2, v2

fptr.write result
fptr.write "\n"

fptr.close
