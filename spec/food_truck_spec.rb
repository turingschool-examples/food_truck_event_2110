require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@food_truck).to be_instance_of(FoodTruck)
    end

    it 'has a name' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'has an inventory' do
      expect(@food_truck.inventory).to eq({})
    end
  end
end 
