require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do

  it 'food truck class exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'food truck name' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'check if food inventory is a empty hash' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end



end
