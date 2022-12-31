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

    while current_index > 0 && @nodes[parent_index] > @nodes[current_index]
      swap(parent_index, current_index)
      current_index = parent_index
      parent_index = parent_of(current_index)
    end
  end

  def pop
    res = @nodes[0]

    @nodes[0] = @nodes.pop

    current_index = 0
    child_index = min_child_of(current_index)

    while child_index && @nodes[child_index] < @nodes[current_index]
      swap(child_index, current_index)
      current_index = child_index
      child_index = min_child_of(current_index)
    end

    res
  end

  private

  def parent_of(index)
    (index - 1) / 2
  end

  def min_child_of(index)
    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2

    left_val = nodes[left_child_index]
    right_val = nodes[right_child_index]

    if left_val && right_val
      left_val <= right_val ? left_child_index : right_child_index
    elsif left_val
      left_child_index
    end
  end

  def swap(i, j)
    @nodes[i], @nodes[j] = @nodes[j], @nodes[i]
  end
end
