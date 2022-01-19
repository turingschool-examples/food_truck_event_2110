require './lib/item'
require 'rspec'
require 'pry'

RSpec.describe Item do

  context 'iteration I' do

    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

    it 'exists' do

      expect(item1).to be_an_instance_of(Item)
    end

    it 'has attributes' do

      expect(item2.name).to eq("Apple Pie (Slice)")
      expect(item2.price).to eq(2.50)
    end
  end
end
