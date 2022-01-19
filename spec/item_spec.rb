require './lib/item'
require 'pry'
RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end
  it 'to be instance of Item ' do
    expect(@item1).to be_instance_of(Item)
  end
  it 'will have a name ' do
    expect(@item1.name).to eq('Peach Pie (Slice)')
  end
  it 'will have a price' do
    expect(@item1.price).to eq(3.75)
  end

end
