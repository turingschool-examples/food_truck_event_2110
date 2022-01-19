require './lib/item'


RSpec.describe "Iteration 1" do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it "exists" do
    expect(item1).to be_a Item
  end

  it "has attributes" do
    expect(item1.name).to eq('Peach Pie (Slice)')
    expect(item1.price).to eq('$3.75')
  end
end
