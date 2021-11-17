require './lib/item'
require './lib/food_truck'

describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe '#initialize' do
    it 'returns an instance of Item' do
      expect(@item1).to be_a Item
    end

    it 'returns the item name' do
      expect(@item2.name).to eq("Apple Pie (Slice)")
    end

    it 'returns the price of the item' do
      expect(@item2.price).to eq(2.50)
    end
  end
