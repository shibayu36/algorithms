# https://www.hackerrank.com/contests/programming-interview-questions/challenges/fibonacci-lite/problem
def fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1

  fibonacci(n - 1) + fibonacci(n - 2)
end

input = $stdin.gets.to_i
puts(fibonacci(input))
