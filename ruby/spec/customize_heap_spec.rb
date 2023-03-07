require 'customize_heap'

describe CustomizeHeap do
  describe '#push' do
    it do
      heap = CustomizeHeap.new([4, 1, 3])
      expect(heap.nodes).to eq([1, 4, 3])

      heap.push(5)
      expect(heap.nodes).to eq([1, 4, 3, 5])

      heap.push(0)
      expect(heap.nodes).to eq([0, 1, 3, 5, 4])
    end
  end

  describe '#pop' do
    it do
      heap = CustomizeHeap.new([0, 1, 3, 5, 4, 3])

      expect(heap.pop).to eq 0
      expect(heap.nodes).to eq([1, 3, 3, 5, 4])

      expect(heap.pop).to eq 1
      expect(heap.nodes).to eq([3, 4, 3, 5])

      expect(heap.pop).to eq 3
      expect(heap.pop).to eq 3
      expect(heap.pop).to eq 4
      expect(heap.pop).to eq 5

      expect(heap.pop).to eq nil
    end
  end

  describe 'Customizable' do
    it 'can customize to max heap' do
      heap = CustomizeHeap.new([0, 1, 3, 5, 4, 3]) do |nodes, p_i, c_i|
        nodes[p_i] >= nodes[c_i]
      end

      expect(heap.pop).to eq 5
      expect(heap.pop).to eq 4
      expect(heap.pop).to eq 3
      expect(heap.pop).to eq 3
      expect(heap.pop).to eq 1
      expect(heap.pop).to eq 0

      expect(heap.pop).to eq nil
    end
  end
end
