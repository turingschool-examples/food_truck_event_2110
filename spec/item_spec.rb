require './lib/item'
require 'pry'

RSpec.describe Item do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it "exists" do
    expect(@item1).to be_instance_of(Item)
    expect(@item2).to be_instance_of(Item)
  end

  it "item has a name" do
    expect(@item2.name).to eq('Apple Pie (Slice)')
  end

  it "item has a price" do
    expect(@item2.price).to eq('$2.50')
  end

end
