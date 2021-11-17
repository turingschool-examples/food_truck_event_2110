require './lib/item'

RSpec.describe Item do
  let(:item) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}

  it 'exists' do
    expect(item).to be_a Item
  end

  it 'has attributes' do
    expect(item.name).to eq 'Peach Pie (Slice)'
    expect(item.price).to eq "$3.75"
  end


end
