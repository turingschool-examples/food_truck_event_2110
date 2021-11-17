require './lib/item'

RSpec.describe Item do
  xit 'exists' do
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(item2).to be_an_instance_of(Item)
  end

  xit 'has a name' do
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(item2.name).to eq("Apple Pie (Slice)")
  end

  xit 'has a price' do
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(item2.price).to eq(2.50)
  end
end
