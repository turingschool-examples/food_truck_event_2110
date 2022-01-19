require './lib/item'
require './lib/food_truck'
require 'pry'
require 'rspec'

describe FoodTruck do
  it "is a class with attributes" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})

  end

  it "interacts with other classes" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(food_truck.check_stock(item1).to eq(0)
  end
end
