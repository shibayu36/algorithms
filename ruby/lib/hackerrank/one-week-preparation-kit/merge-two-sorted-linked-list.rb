class SinglyLinkedListNode
  attr_accessor :val, :next

  def initialize(val, nxt = nil)
    @val = val
    @next = nxt
  end
end

def make_list_from_array(array)
  list = SinglyLinkedListNode.new(array[0])
  prev = list
  array[1..].each do |v|
    current = SinglyLinkedListNode.new(v)
    prev.next = current
    prev = current
  end

  list
end

def merge_lists(l1, l2)
  l1_cur = l1
  l2_cur = l2

  res = SinglyLinkedListNode.new(nil)
  res_cur = res

  while l1_cur && l2_cur
    if l1_cur.val < l2_cur.val
      res_cur.next = l1_cur
      res_cur = res_cur.next
      l1_cur = l1_cur.next
    else
      res_cur.next = l2_cur
      res_cur = res_cur.next
      l2_cur = l2_cur.next
    end
  end

  if l1_cur
    res_cur.next = l1_cur
  elsif l2_cur
    res_cur.next = l2_cur
  end

  res.next
end

def list_to_a(l)
  result = []
  current = l
  while current
    result << current.val
    current = current.next
  end
  result
end

# p(make_list_from_array([1]))
# p(make_list_from_array([1, 2]))
# p(list_to_a(merge_lists(make_list_from_array([1, 3, 7]), make_list_from_array([1, 2]))))

test_case_num = gets.strip.to_i

test_case_num.times do
  a1 = []
  a1_count = gets.strip.to_i
  a1_count.times do
    a1.push(gets.strip.to_i)
  end
  l1 = make_list_from_array(a1)

  a2 = []
  a2_count = gets.strip.to_i
  a2_count.times do
    a2.push(gets.strip.to_i)
  end
  l2 = make_list_from_array(a2)

  result = merge_lists(l1, l2)
  puts(list_to_a(result).join(' '))
end
