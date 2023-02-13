require 'json'
require 'stringio'

#
# Complete the 'matchingStrings' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. STRING_ARRAY strings
#  2. STRING_ARRAY queries
#

def matchingStrings(strings, queries)
  string_to_count = Hash.new(0)
  strings.each do |string|
    string_to_count[string] += 1
  end

  queries.map do |query|
    string_to_count[query] || 0
  end
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

strings_count = gets.strip.to_i

strings = Array.new(strings_count)

strings_count.times do |i|
  strings_item = gets.chomp

  strings[i] = strings_item
end

queries_count = gets.strip.to_i

queries = Array.new(queries_count)

queries_count.times do |i|
  queries_item = gets.chomp

  queries[i] = queries_item
end

res = matchingStrings strings, queries

fptr.write res.join "\n"
fptr.write "\n"

fptr.close
