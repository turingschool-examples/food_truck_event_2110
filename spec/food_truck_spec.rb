require 'RSpec'
require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:food_truck){FoodTruck.new("Rocky Mountain Pies")}
  let(:item1){Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2){item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'exists' do
    expect(food_truck).to be_a(FoodTruck)
  end

  it 'has attributes' do
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  it 'can check inventory stock' do
    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it 'can add stock to inventory, and check stock' do
    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to eq({item1 => 30})
    expect(food_truck.check_stock(item1)).to eq(30)
  end
end
