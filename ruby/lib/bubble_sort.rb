module BubbleSort
  def self.exec(arr)
    (1..arr.length - 1).each do |i|
      (0..arr.length - 1 - i).each do |j|
        if arr[j] > arr[j + 1]
          arr[j], arr[j + 1] = arr[j + 1], arr[j]
        end
      end
    end
    arr
  end
end
