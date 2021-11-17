require './lib/item'

RSpec.describe Item do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'exists' do
    expect(item1).to be_an_instance_of(Item)
  end

  it 'has attributes' do
    expect(item2.name).to be_an_instance_of('Apple Pie (Slice)')
    expect(item2.price).to be_an_instance_of(2.50)
  end
end
