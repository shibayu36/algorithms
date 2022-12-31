# https://www.hackerrank.com/contests/programming-interview-questions/challenges/factorial-n

# Enter your code here. Read input from STDIN. Print output to STDOUT
def factorial(n)
  return 1 if n <= 1

  (1..n).reduce(1) do |acc, i|
    acc * i
  end
end

input = $stdin.gets
puts(factorial(input.to_i))
