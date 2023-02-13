#
# Complete the 'findMedian' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#

def findMedian(arr)
  # Write your code here
  arr.sort[arr.size / 2]
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
