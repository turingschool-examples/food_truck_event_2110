require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end
  describe 'initialize' do
    it 'exists' do
      expect(@food_truck).to be_a(FoodTruck)
    end
    it 'has_attributes' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
      expect(@food_truck.inventory).to eq({})
    end
  end

  describe 'methods' do
    describe ' #check_stock' do

    end
    describe ' #stock' do
      
    end
  end
end
