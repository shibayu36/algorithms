require 'json'
require 'stringio'
require 'prime'

#
# Complete the 'waiter' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER_ARRAY number
#  2. INTEGER q
#

def waiter(number, q)
  stack = number.reverse
  answers = []

  Prime.take(q).each do |prime|
    other_stack = []

    while stack.size > 0
      target = stack.pop
      if target % prime == 0
        answers.push(target)
      else
        other_stack.push(target)
      end
    end

    stack = other_stack
  end

  if stack.size > 0
    answers += stack
  end

  answers
end

# def waiter(number, q)
#   stacks = [number.reverse, []]
#   answers = []

#   Prime.take(q).each_with_index do |prime, i|
#     pop_stack = stacks[i % 2]
#     push_stack = stacks[(i + 1) % 2]

#     while pop_stack.size > 0
#       target = pop_stack.pop
#       if target % prime == 0
#         answers.push(target)
#       else
#         push_stack.push(target)
#       end
#     end
#   end

#   if stacks[0].empty?
#     answers += stacks[1]
#   else
#     answers += stacks[0]
#   end

#   answers
# end

# p(waiter([3, 4, 7, 6, 5], 1))
# p(waiter([3, 3, 4, 4, 9], 2))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

q = first_multiple_input[1].to_i

number = gets.rstrip.split.map(&:to_i)

result = waiter number, q

fptr.write result.join "\n"
fptr.write "\n"

fptr.close
