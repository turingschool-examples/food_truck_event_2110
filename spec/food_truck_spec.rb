require './lib/food_truck'


RSpec.describe Foodtruck do
  describe "Iteration 1" do
    before :each do
      @food_truck = Foodtruck.new("Rocky Mountain Pies")
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    end

    it "exists" do
      expect(@food_truck).to be_a(Foodtruck)
    end

    it "checks the attributes " do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
      expect(@food_truck.inventory).to eq({})
    end

    it "checks that count of the inventory" do
      expect(@food_truck.check_stock(@item1)).to eq(0)
      @food_truck.stock(@item1, 30)
      expect(@food_truck.check_stock(@item1)).to eq(30)
      @food_truck.stock(@item1, 25)
      expect(@food_truck.check_stock(@item1)).to eq(55)
      @food_truck.stock(@item2, 12)
      expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end
end
