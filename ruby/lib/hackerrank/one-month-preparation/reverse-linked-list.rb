require 'json'
require 'stringio'

class SinglyLinkedListNode
  attr_accessor :data, :next

  def initialize(node_data)
    @data = node_data
    @next = nil
  end
end

class SinglyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def insert_node(node_data)
    node = SinglyLinkedListNode.new node_data

    if head
      tail.next = node
    else
      self.head = node
    end

    self.tail = node
  end
end

def print_singly_linked_list(node, sep, fptr)
  until node.nil?
    fptr.write node.data

    node = node.next

    fptr.write sep unless node.nil?
  end
end

#
# Complete the 'reverse' function below.
#
# The function is expected to return an INTEGER_SINGLY_LINKED_LIST.
# The function accepts INTEGER_SINGLY_LINKED_LIST llist as parameter.
#

#
# For your reference:
#
# SinglyLinkedListNode
#     int data
#     SinglyLinkedListNode next
#
#

def reverse(llist)
  prev_pointer = nil
  current_pointer = llist

  while current_pointer
    next_pointer = current_pointer.next
    current_pointer.next = prev_pointer

    prev_pointer = current_pointer
    current_pointer = next_pointer
  end

  prev_pointer
end

# llist = SinglyLinkedList.new
# llist.insert_node(1)
# llist.insert_node(2)
# llist.insert_node(3)
# llist.insert_node(4)
# llist.insert_node(5)
# p(llist)

# reverse(llist)
# p(llist)

fptr = File.open(ENV.fetch('OUTPUT_PATH', nil), 'w')

tests = gets.to_i

tests.times do |_tests_itr|
  llist = SinglyLinkedList.new

  gets.to_i.times do
    llist_item = gets.to_i
    llist.insert_node llist_item
  end

  llist1 = reverse llist.head

  print_singly_linked_list llist1, ' ', fptr
  fptr.write "\n"
end

fptr.close
