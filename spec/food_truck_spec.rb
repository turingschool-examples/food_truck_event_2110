require_relative './spec_helper'

RSpec.describe FoodTruck do
  let (:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let (:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}

  it 'exists' do
    expect(food_truck). to be_instance_of FoodTruck
  end

  it 'initializes with a name' do
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'begins with no inventory' do
    expect(food_truck.inventory).to eq({})
  end

  it 'can stock items in inventory and check the stock' do
    expect(food_truck.inventory).to eq({})
    expect(food_truck.check_stock(item1)).to eq(0)

    food_truck.stock(item1, 30)

    expect(food_truck.inventory).to eq({item1 => 30})
    expect(food_truck.check_stock(item1)).to eq(30)
  end

end
