require 'json'
require 'stringio'

#
# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def timeConversion(s)
  # Write your code here
  hour = s[0..1]
  min_sec = s[3..7]

  if s[8..9] == 'PM' && hour != '12'
    hour = hour.to_i + 12
  elsif s[8..9] == 'AM' && hour == '12'
    hour = '00'
  end

  "#{hour}:#{min_sec}"
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

s = gets.chomp

result = timeConversion s

fptr.write result
fptr.write "\n"

fptr.close
