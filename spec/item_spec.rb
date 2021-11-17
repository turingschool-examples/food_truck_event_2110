require './lib/item'
require "rspec"

describe Item do
  it 'exists' do
    expect(item1).to be_an_instance_of(Item)
  end

  it 'attributes' do
    expect(item1.name).to eq('Peach Pie (Slice)')
    expect(item1.price).to eq('$3.75')
  end
end
