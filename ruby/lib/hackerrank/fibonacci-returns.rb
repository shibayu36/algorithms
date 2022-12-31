# https://www.hackerrank.com/contests/programming-interview-questions/challenges/fibonacci-returns/problem
$fibonaccies = [0, 1]
def fibonacci(n)
  return $fibonaccies[n] if $fibonaccies[n]

  $fibonaccies[n] = fibonacci(n - 1) + fibonacci(n - 2)
end

while input = $stdin.gets
  puts(fibonacci(input.to_i))
end
