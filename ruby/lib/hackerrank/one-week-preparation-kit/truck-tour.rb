require 'json'
require 'stringio'

#
# Complete the 'truckTour' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY petrolpumps as parameter.
#

def truckTour(petrolpumps)
  # Write your code here
  size = petrolpumps.size

  petrolpumps.each_with_index do |_petrolpumb, start_index|
    current_petrol = 0
    (start_index..start_index + size - 1).each do |current_index|
      actual_index = current_index % size
      current_petrol += petrolpumps[actual_index][0]
      current_petrol -= petrolpumps[actual_index][1]
      if current_petrol < 0
        break
      end
    end
    return start_index if current_petrol >= 0
  end
end

# puts(truckTour([[1, 5], [10, 3], [3, 4]]))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

n = gets.strip.to_i

petrolpumps = Array.new(n)

n.times do |i|
  petrolpumps[i] = gets.rstrip.split.map(&:to_i)
end

result = truckTour petrolpumps

fptr.write result
fptr.write "\n"

fptr.close
