require './lib/item'

RSpec.describe Item do
  let(:item) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}

  it 'exists' do
    expect(item).to be_a Item
  end


end
