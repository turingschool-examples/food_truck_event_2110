require './lib/item'
require './lib/food_truck'
require 'pry'


RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@food_truck).to be_a(FoodTruck)
  end

  it "returns attributes of FoodTruck" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
  end

  it '#check_stock returns default value of 0' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it '#stock places items into inventory' do
      @food_truck.stock(@item1, 30)
      expect(@food_truck.inventory).to eq({@item1=>30})
  end

  it '@check_stock returns quantity of item' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end




end
