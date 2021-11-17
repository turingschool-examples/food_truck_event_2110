require './lib/item'
require './lib/food_truck'

RSpec.describe 'food truck' do
  before(:each) do
    @item1      = Item.new({name: 'Peach Pie (Slice)',
                            price: "$3.75"})
    @item2      = Item.new({name: 'Apple Pie (Slice)',
                            price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it "exists" do
    expect(@food_truck).to be_a FoodTruck
  end

  it "has attributes that are readable" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
  end

  it "can stock items in the inventory" do
    expect(@food_truck.inventory).to eq({})

    @food_truck.stock(@item1, 30)

    expect(@food_truck.inventory).to eq({@item1 => 30})
  end
end
