require 'heap'

describe Heap do
  describe '#push' do
    it do
      heap = Heap.new([4, 1, 3])
      expect(heap.nodes).to eq([1, 4, 3])

      heap.push(5)
      expect(heap.nodes).to eq([1, 4, 3, 5])

      heap.push(0)
      expect(heap.nodes).to eq([0, 1, 3, 5, 4])
    end
  end

  describe '#pop' do
    it do
      heap = Heap.new([0, 1, 3, 5, 4, 3])

      expect(heap.pop).to eq 0
      expect(heap.nodes).to eq([1, 3, 3, 5, 4])

      expect(heap.pop).to eq 1
      expect(heap.nodes).to eq([3, 4, 3, 5])

      expect(heap.pop).to eq 3
      expect(heap.pop).to eq 3
      expect(heap.pop).to eq 4
      expect(heap.pop).to eq 5
    end
  end
end
