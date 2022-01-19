require_relative './spec_helper'

RSpec.describe Item do
  let (:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let (:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'exists' do
    expect(item2).to be_instance_of Item
  end

  it 'initializes with a name and price' do
    expect(item2.name).to eq("Apple Pie (Slice)")
    expect(item2.price).to eq(2.50)
  end
end
