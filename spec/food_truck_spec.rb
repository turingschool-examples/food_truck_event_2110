require './lib/item'
require './lib/food_truck'

RSpec.describe 'food truck' do
  before(:each) do
    @item1       = Item.new({name: 'Peach Pie (Slice)',
                            price: "$3.75"})
    @item2       = Item.new({name: 'Apple Pie (Slice)',
                            price: '$2.50'})
    @item3       = Item.new({name: "Peach-Raspberry Nice Cream",
                             price: "$5.30"})
    @item4       = Item.new({name: "Banana Nice Cream",
                             price: "$4.25"})
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
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
    @food_truck.stock(@item2, 12)

    expect(@food_truck.inventory).to eq({@item1 => 30,
                                         @item2 => 12})
  end

  it "can check the stock in the inventory" do
    expect(@food_truck.check_stock(@item1)).to eq 0

    @food_truck.stock(@item1, 30)

    expect(@food_truck.check_stock(@item1)).to eq 30

    @food_truck.stock(@item1, 25)

    expect(@food_truck.check_stock(@item1)).to eq 55
  end

  it "can calculate potential revenue from inventory" do

  end
end
