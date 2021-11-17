require './lib/item'
require './lib/food_truck'


RSpec.describe FoodTruck do

  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'item exists' do
    expect(@item1).to be_an_instance_of(Item)
    expect(@item2).to be_an_instance_of(Item)
  end

  it 'reads item name' do
    expect(@item1.name).to eq('Peach Pie (Slice)')
    expect(@item2.name).to eq('Apple Pie (Slice)')
  end

  it 'reads item price' do
    expect(@item1.price).to eq(3.75)
    expect(@item2.price).to eq(2.50)
  end

  it 'food_truck exists' do
    expect(@food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'food_truck has an empty inventory by default' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'checks stock for given item' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can stock a given item' do
    @food_truck.stock(@item1, 30)

    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it 'can stock extra of a given item' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)

    expect(@food_truck.check_stock(@item1)).to eq(55)
  end

  it 'inventory holds multiple items' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
    expected = {
      @item1 => 55,
      @item2 => 12
    }

    expect(@food_truck.inventory).to eq(expected)
  end

end
