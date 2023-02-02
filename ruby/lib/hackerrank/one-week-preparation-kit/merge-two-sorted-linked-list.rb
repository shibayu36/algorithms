class LinkedList
  attr_accessor :head, :tail

  def initialize(array = [])
    if array.empty?
      @head = nil
      @tail = nil
      return
    end

    list = Node.new(array[0])
    prev = list
    array[1..].each do |v|
      current = Node.new(v)
      prev.next = current
      prev = current
    end

    @head = list
    @tail = prev
  end

  def push(val)
    node = Node.new(val)

    unless @head
      @head = node
      @tail = node
    end

    @tail.next = node
    @tail = node
  end

  def empty?
    @head.nil?
  end

  def to_a
    result = []
    current = @head
    while current
      result << current.val
      current = current.next
    end
    result
  end
end

class Node
  attr_accessor :val, :next

  def initialize(val, n = nil)
    @val = val
    @next = n
  end
end

def merge_list(l1, l2)
  return l1 if l2.empty?
  return l2 if l1.empty?

  result = LinkedList.new

  l1_point = l1.head
  l2_point = l2.head

  while l1_point || l2_point
    unless l1_point
      result.push(l2_point.val)
      l2_point = l2_point.next
      next
    end
    unless l2_point
      result.push(l1_point.val)
      l1_point = l1_point.next
      next
    end

    if l1_point.val < l2_point.val
      result.push(l1_point.val)
      l1_point = l1_point.next
    elsif l1_point.val >= l2_point.val
      result.push(l2_point.val)
      l2_point = l2_point.next
    end
  end

  result
end

# p(merge_list(LinkedList.new([]), LinkedList.new([])).to_a)
# p(merge_list(LinkedList.new([1]), LinkedList.new([])).to_a)
# p(merge_list(LinkedList.new([]), LinkedList.new([2])).to_a)
# p(merge_list(LinkedList.new([]), LinkedList.new([2, 3])).to_a)
# p(merge_list(LinkedList.new([1, 3, 7]), LinkedList.new([1, 2])).to_a)
# p(merge_list(LinkedList.new([1, 2, 3]), LinkedList.new([3, 4])).to_a)

test_case_num = gets.strip.to_i

test_case_num.times do
  l1 = LinkedList.new
  l1_count = gets.strip.to_i
  l1_count.times do
    l1.push(gets.strip.to_i)
  end

  l2 = LinkedList.new
  l2_count = gets.strip.to_i
  l2_count.times do
    l2.push(gets.strip.to_i)
  end

  result = merge_list(l1, l2)
  puts(result.to_a.join(' '))
end
