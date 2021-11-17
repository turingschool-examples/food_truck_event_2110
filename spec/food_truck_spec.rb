require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do

  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("The Batmobile")
  end

  it 'exists' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it 'can read object name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'initializes empty @inventory hash' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'can #stock item objects into @inventory' do
    item = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck.stock(item, 30)

    expected_hash = {item => 30}
    expect(@food_truck.inventory).to eq(expected_hash)
  end

  it 'can #check_stock of a given item' do
    item = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck.stock(item, 30)

    expect(@food_truck.check_stock(item)).to eq(30)

    @food_truck.stock(item, 30)
    expect(@food_truck.check_stock(item)).to eq(60)
  end

  it 'can return #potential_revenue' do
    item = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item2 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})

    @food_truck.stock(item, 30)
    @food_truck2.stock(item, 20)
    @food_truck2.stock(item2, 15)

    expect(@food_truck.potential_revenue).to eq(75)
    expect(@food_truck2.potential_revenue).to eq(129.5)
  end

end
