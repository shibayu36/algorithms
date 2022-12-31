# https://www.hackerrank.com/contests/programming-interview-questions/challenges/m-th-to-last-element/problem

class LinkedListItem
  attr_accessor :val, :next, :prev

  def initialize(val, prev = nil, nxt = nil)
    @val = val
    @prev = prev
    @next = nxt
  end
end

class LinkedList
  attr_reader :head, :last

  def initialize(vals)
    @head = LinkedListItem.new(vals.first)
    prev = head
    vals[1..].each do |val|
      current = LinkedListItem.new(val, prev)
      prev = current
    end
    @last = prev
  end

  def mth_to_last_element(m)
    target = @last
    (1..m - 1).each do
      target = target.prev
      break unless target
    end
    target
  end
end

m = $stdin.gets.to_i
list = $stdin.gets.split(' ').map(&:to_i)

result = LinkedList.new(list).mth_to_last_element(m)
puts(result ? result.val : 'NIL')

# linked-list
# * memory: O(n)
# * search: O(n)
# * insert/delete: O(1)
# array
# * memory: O(n)
# * search: O(1)
# * insert/delete: O(n)
