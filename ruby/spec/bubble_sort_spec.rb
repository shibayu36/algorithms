require 'bubble_sort'

describe BubbleSort do
  describe '.exec' do
    context 'passes empty array' do
      it 'returns empty array' do
        expect(BubbleSort.exec([])).to eq([])
      end
    end

    context 'passes one item array' do
      it 'returns same array' do
        expect(BubbleSort.exec([1])).to eq([1])
      end
    end

    context 'passes two items array' do
      it 'returns sorted array' do
        expect(BubbleSort.exec([2, 1])).to eq([1, 2])
      end
    end

    context 'passes array having some items' do
      it 'returns sorted array' do
        expect(BubbleSort.exec([1, 4, 2, 3, 8])).to eq([1, 2, 3, 4, 8])
      end
    end
  end
end
