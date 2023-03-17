class LinkedList
  attr_reader :head, :tail

  def initialize(head = nil)
    if head
      @head = head
      @tail = head
      until @tail.next.nil?
        @tail = @tail.next
      end
    else
      @head = nil
      @tail = nil
    end
  end

  def push(value)
    node = LinkedListNode.new(value)

    if @tail.nil?
      @head = node
      @tail = node
      return
    end

    @tail.next = node
    @tail = node
  end

  def to_a
    res = []
    current = @head
    while current
      res.push(current.value)
      current = current.next
    end
    res
  end
end

class LinkedListNode
  attr_accessor :value, :next

  def initialize(value = nil)
    @value = value
    @next = nil
  end
end

def merge_lists(l1, l2)
  root = LinkedListNode.new
  current = root

  l1_p = l1.head
  l2_p = l2.head

  while l1_p && l2_p
    if l1_p.value <= l2_p.value
      current.next = l1_p
      l1_p = l1_p.next
    else
      current.next = l2_p
      l2_p = l2_p.next
    end
    current = current.next
  end

  while l1_p
    current.next = l1_p
    l1_p = l1_p.next
    current = current.next
  end
  while l2_p
    current.next = l2_p
    l2_p = l2_p.next
    current = current.next
  end

  LinkedList.new(root.next)
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
