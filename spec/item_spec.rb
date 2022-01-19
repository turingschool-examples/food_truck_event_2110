require './lib/item'
RSpec.describe do Item
  context 'iteration1' do
    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}

    it 'exists' do
      expect(item1).to be_a(Item)
    end
  end
end
