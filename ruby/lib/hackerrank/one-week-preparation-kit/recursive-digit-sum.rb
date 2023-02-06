require 'json'
require 'stringio'

#
# Complete the 'superDigit' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. STRING n
#  2. INTEGER k
#

def superDigit(n, k)
  target = n.split('').map(&:to_i).sum * k

  until target < 10
    target = target.digits.sum
  end

  target
end

# puts(superDigit('9875', 4))
# calculation problem?
# puts(superDigit(
#        '3546630947312051453014172159647935984478824945973141333062252613718025688716704470547449723886626736',
#        100_000
#      ))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0]

k = first_multiple_input[1].to_i

result = superDigit n, k

fptr.write result
fptr.write "\n"

fptr.close
