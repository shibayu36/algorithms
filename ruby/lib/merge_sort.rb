module MergeSort
  def self.exec(arr, left = 0, right = arr.length)
    return arr if left >= right - 1

    mid = (left + right) / 2
    exec(arr, left, mid)
    exec(arr, mid, right)
    merge(arr, left, mid, right)

    arr
  end

  def self.merge(arr, left, mid, right)
    left_cursor = left
    right_cursor = mid

    temp_arr = []

    while left_cursor < mid || right_cursor < right
      if left_cursor >= mid
        temp_arr << arr[right_cursor]
        right_cursor += 1
      elsif right_cursor >= right
        temp_arr << arr[left_cursor]
        left_cursor += 1
      elsif arr[left_cursor] < arr[right_cursor]
        temp_arr << arr[left_cursor]
        left_cursor += 1
      else
        temp_arr << arr[right_cursor]
        right_cursor += 1
      end
    end

    arr[left..right - 1] = temp_arr
  end
end
