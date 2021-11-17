require './lib/item'

describe Item do
  before(:each) do
    @item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  end
  describe 'initialize' do
    it 'exists' do
      expect(@item).to be_a(Item)
    end
    it 'has_attributes' do
      expect(@item.name).to eq('Peach Pie (Slice)')
      expect(@item.price).to eq("$3.75")
    end
  end
end
