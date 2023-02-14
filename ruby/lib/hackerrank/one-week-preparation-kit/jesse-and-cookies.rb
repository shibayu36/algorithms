require 'json'
require 'stringio'

#
# Complete the 'cookies' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY A
#

class Heap
  attr_reader :nodes

  def initialize(arr)
    @nodes = []
    arr.each { |val| push(val) }
  end

  def size
    @nodes.size
  end

  def push(val)
    @nodes.push(val)

    current_index = size - 1
    parent_index = parent_of(size - 1)

    while current_index > 0 && !priority_cmp(parent_index, current_index)
      swap(parent_index, current_index)
      current_index = parent_index
      parent_index = parent_of(current_index)
    end
  end

  def pop
    return @nodes.pop if size <= 1

    res = @nodes[0]

    @nodes[0] = @nodes.pop

    current_index = 0
    child_index = priority_child_of(current_index)

    while child_index && priority_cmp(child_index, current_index)
      swap(child_index, current_index)
      current_index = child_index
      child_index = priority_child_of(current_index)
    end

    res
  end

  def top
    size == 0 ? nil : @nodes[0]
  end

  private

  def parent_of(index)
    (index - 1) / 2
  end

  def priority_child_of(index)
    left_child_index = (2 * index) + 1
    right_child_index = (2 * index) + 2

    left_val = nodes[left_child_index]
    right_val = nodes[right_child_index]

    if left_val && right_val
      priority_cmp(left_child_index, right_child_index) ? left_child_index : right_child_index
    elsif left_val
      left_child_index
    end
  end

  def priority_cmp(i, j)
    @nodes[i] <= @nodes[j]
  end

  def swap(i, j)
    @nodes[i], @nodes[j] = @nodes[j], @nodes[i]
  end
end

def cookies(k, a)
  # Write your code here
  heap = Heap.new(a)
  count = 0

  while heap.top < k
    cookie1 = heap.pop
    cookie2 = heap.pop
    return -1 if cookie2.nil?

    made_cookie = cookie1 + (cookie2 * 2)
    heap.push(made_cookie)
    count += 1
  end

  count
end

# puts(cookies(7, [1, 2, 3, 9, 10, 12]))

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

first_multiple_input = gets.rstrip.split

n = first_multiple_input[0].to_i

k = first_multiple_input[1].to_i

a = gets.rstrip.split.map(&:to_i)

result = cookies k, a

fptr.write result
fptr.write "\n"

fptr.close
