require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe "Iteration 1" do
    it "exists" do
      expect(@item1 && @item2).to be_an_instance_of(Item)
    end
    it "has name" do
      expect(@item2.name).to eq("Apple Pie (Slice)")
    end
    it "has price" do
      expect(@item2.price).to eq(2.50)
    end
  end
end
