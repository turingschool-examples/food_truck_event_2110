require './lib/food_truck'
require './lib/item'
require 'pry'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it "exists" do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it "has a name" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has an inventory" do
    expect(@food_truck.inventory).to eq({})
  end

  it "can check inventory stock" do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it "can see inventory after adding items" do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
  end

  it "can add inventory" do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it "can add inventory" do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end




end
