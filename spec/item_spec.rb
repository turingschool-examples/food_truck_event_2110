require './lib/item'
require './lib/food_truck'

RSpec.describe Item do
  it 'exists' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(item1).to be_instance_of(Item)
    expect(item2).to be_instance_of(Item)
  end

  it 'item2 has a name' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(item2.name).to eq("Apple Pie (Slice)")
  end

  it 'item2 has a price' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(item2.price).to eq(2.50)
  end

end
