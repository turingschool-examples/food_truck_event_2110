require 'rspec'
require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it 'has attributes' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'starts with empty inventory hash' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'defaults to 0 value for check stock' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can add stock w stock method to the hash inventory' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
  end

end
