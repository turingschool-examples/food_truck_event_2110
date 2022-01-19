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

  it 'check if check is 0' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(food_truck.check_stock(item1)).to eq(0)
  end


end
