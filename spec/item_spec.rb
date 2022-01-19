require './lib/item'

RSpec.describe '#item' do
  it 'exist' do
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    expect(item1).to be_a(Item)
    expect(item2).to be_a(Item)
  end

  it 'has a name' do
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    expect(item2.name).to eq('Apple Pie (Slice)')
  end

  it 'has a price' do
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    expect(item2.price).to eq(2.50)
  end
end
