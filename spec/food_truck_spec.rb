require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_a(FoodTruck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'stocks items' do
    @food_truck.stock(@item1, 5)
    @food_truck.stock(@item2, 6)

    expect(@food_truck.inventory.length).to eq(2)
  end

  it 'has inventory' do
    @food_truck.stock(@item1, 5)
    @food_truck.stock(@item2, 6)
    expected = {
      @item1 => 5,
      @item2 => 6
    }

    expect(@food_truck.inventory).to eq(expected)
  end

  it 'checks stock by item name' do
    @food_truck.stock(@item1, 5)

    expect(@food_truck.check_stock(@item1)).to eq(5)
  end

  it 'calculates potential revenue' do
    @food_truck.stock(@item1, 2)
    @food_truck.stock(@item2, 3)
    expected = 15.00

    expect(@food_truck.potential_revenue).to eq(expected)
  end
end
