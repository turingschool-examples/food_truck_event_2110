require './lib/item'

RSpec.describe Item do
  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }
  it 'exists' do
    actual = item1
    expected = Item

    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = item1.name
      expected = 'Peach Pie (Slice)'

      expect(actual).to eq(expected)
    end
    it 'has a price' do
      actual = item1.price
      expected = '$3.75'

      expect(actual).to eq(expected)
    end
  end
end
