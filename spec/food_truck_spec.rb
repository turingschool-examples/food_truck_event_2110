require './lib/item'
require './lib/food_truck'
require 'pry'

RSpec.describe FoodTruck do
  describe "#iteration 1 - food_truck" do
    it 'can create a food truck' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
    end

    it 'can read foodtrucks names' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'has inventory as a hash' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to eq({})
    end

    it 'can check the stock of an item' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    expect(food_truck.check_stock(item1)).to be(0)
    end

    it 'can add to the stock of an item' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to eq({item1=>30})
    end

    it 'can return /update the stock of an item' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)
    expect(food_truck.check_stock(item1)).to be(30)
    end

    it 'can add to an existing stock of an item' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock(item1)).to be(55)
    end

    it 'can add to an existing stock of an item' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    food_truck.stock(item2, 12)
    expect(food_truck.check_stock(item2)).to be(12)
    end

    it 'can return the final updated hash' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)
    food_truck.stock(item2, 12)
    expect(food_truck.inventory).to eq({item1=>55, item2=>12})
    end
  end
end
