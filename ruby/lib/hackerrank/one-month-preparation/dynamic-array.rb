#!/bin/ruby

require 'json'
require 'stringio'

class Solver
  attr_reader :answers

  def initialize(n, queries)
    @n = n
    @arr = Array.new(n) { [] }
    @queries = queries
    @last_answer = 0
    @answers = []
  end

  def execute
    @queries.each do |query|
      command, x, y = query
      case command
      when 1
        query1(x, y)
      when 2
        query2(x, y)
      end
    end

    @answers
  end

  def query1(x, y)
    idx = ((x ^ @last_answer) % @n)
    @arr[idx].push(y)
  end

  def query2(x, y)
    idx = ((x ^ @last_answer) % @n)
    @last_answer = @arr[idx][y % @arr[idx].size]
    @answers.push(@last_answer)
  end
end

#
# Complete the 'dynamicArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER n
#  2. 2D_INTEGER_ARRAY queries
#

def dynamicArray(n, queries)
  solver = Solver.new(n, queries)
  solver.execute
end

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')
# fptr = $stdout

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

q = first_multiple_input[1].to_i

queries = Array.new(q)

q.times do |i|
  queries[i] = gets.rstrip.split.map(&:to_i)
end

result = dynamicArray n, queries

fptr.write result.join "\n"
fptr.write "\n"

fptr.close
