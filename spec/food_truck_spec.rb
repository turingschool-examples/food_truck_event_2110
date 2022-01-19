require 'RSpec'
require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:food_truck1){FoodTruck.new("Rocky Mountain Pies")}
  let(:food_truck2){food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")}
  let(:food_truck3){food_truck3 = FoodTruck.new("Palisade Peach Shack")}
  let(:item1){Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2){item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:item3){Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4){item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})}

  it 'exists' do
    expect(food_truck1).to be_a(FoodTruck)
  end

  it 'has attributes' do
    expect(food_truck1.name).to eq("Rocky Mountain Pies")
    expect(food_truck1.inventory).to eq({})
  end

  it 'can check inventory stock' do
    expect(food_truck1.check_stock(item1)).to eq(0)
  end

  it 'can add stock to inventory, and check stock' do
    food_truck1.stock(item1, 30)
    expect(food_truck1.inventory).to eq({item1 => 30})
    expect(food_truck1.check_stock(item1)).to eq(30)
  end

  it 'can add new stock to existing stock in inventory, and check stock' do
    food_truck1.stock(item1, 30)
    expect(food_truck1.inventory).to eq({item1 => 30})
    expect(food_truck1.check_stock(item1)).to eq(30)
    food_truck1.stock(item1, 25)
    expect(food_truck1.check_stock(item1)).to eq(55)
    food_truck1.stock(item2, 12)
    expect(food_truck1.inventory).to eq({item1 => 55, item2 => 12})
  end
end
