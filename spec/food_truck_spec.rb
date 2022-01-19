require './lib/food_truck'
require 'pry'

RSpec.describe Food_truck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_a(Food_truck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'tracks inventory as a hash' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'has no stock' do
    expect(@food_truck.check_stock(item1)).to eq(0)
  end

  it 'can add stock' do
    @food_truck.stock(item1, 30)
    expect(@food_truck.check_stock(item1)).to eq(55)
  end

  it 'can update inventory hash' do
    @food_truck.stock(item1, 30)
    @food_truck.stock(item2, 12)
    expect(food_truck.inventory). to eq(item1 => 30, item2 => 12)
  end

end
