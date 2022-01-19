require './lib/item'
RSpec.describe do Item
  context 'iteration1' do
    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

    it 'exists' do
      expect(item1).to be_a(Item)
    end

    it 'has a name' do
      expect(item2.name).to eq("Apple Pie (Slice)")
    end

    it 'has a name' do
      expect(item2.price).to be(2.50)
    end
  end
end
