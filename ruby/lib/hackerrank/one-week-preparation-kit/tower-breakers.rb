require 'json'
require 'stringio'

#
# Complete the 'towerBreakers' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER m
#

def towerBreakers(n, m)
  return 2 if m == 1

  n.even? ? 2 : 1
end

# puts(towerBreakers(2, 2))
# puts(towerBreakers(1, 4))
# puts(towerBreakers(1, 7))
# puts(towerBreakers(3, 7))
# puts(towerBreakers(2, 6))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

t = gets.strip.to_i

t.times do |_t_itr|
  first_multiple_input = gets.rstrip.split

  n = first_multiple_input[0].to_i

  m = first_multiple_input[1].to_i

  result = towerBreakers n, m

  fptr.write result
  fptr.write "\n"
end

fptr.close
