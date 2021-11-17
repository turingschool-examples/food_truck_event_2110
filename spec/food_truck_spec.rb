require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  describe '#initialize' do
    it 'returns an instance of a food truck' do
      expect(@food_truck).to be_a FoodTruck
    end

    it 'returns the name of the food truck' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'returns the inventory of the food truck' do
      expect(@food_truck.inventory).to eq({})
    end
  end

  
end
