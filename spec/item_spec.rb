require './lib/item'
require './lib/food_truck'
require 'pry'
require 'rspec'

describe Item do
  it "is a class with attributes" do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(item2.name).to eq("Apple Pie (Slice)")
    expect(item2.price).to eq(2.5)
  end


end
