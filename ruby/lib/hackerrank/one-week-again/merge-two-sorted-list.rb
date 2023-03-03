class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    node = LinkedListNode.new(value)

    unless @head
      @head = node
      @tail = node
      return
    end

    @tail.next = node
    @tail = node
  end

  def to_a
    cur = @head
    res = []
    while cur
      res.push(cur.val)
      cur = cur.next
    end
    res
  end
end

class LinkedListNode
  attr_reader :val
  attr_accessor :next

  def initialize(val, nxt = nil)
    @val = val
    @next = nxt
  end
end

def merge_lists(l1, l2)
  return l1 unless l2.head
  return l2 unless l1.head

  result = LinkedList.new

  p1 = l1.head
  p2 = l2.head

  while p1 && p2
    if p1.val <= p2.val
      result.push(p1.val)
      p1 = p1.next
    else
      result.push(p2.val)
      p2 = p2.next
    end
  end

  while p1
    result.push(p1.val)
    p1 = p1.next
  end
  while p2
    result.push(p2.val)
    p2 = p2.next
  end

  result
end

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

  result = merge_lists(l1, l2)
  puts(result.to_a.join(' '))
end
