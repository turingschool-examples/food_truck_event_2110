require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before (:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it "exists" do
    expect(@food_truck).to be_instance_of FoodTruck
  end

  it "has a name" do
    expect(@food_truck.name).to be_instance_of String
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has no inventory by default" do
    expect(@food_truck.inventory).to be_instance_of Hash
    expect(@food_truck.inventory.size).to eq(0)
    expect(@food_truck.inventory).to eq({})
  end

  it "can add inventory" do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to be_instance_of Hash
    expect(@food_truck.inventory.size).to eq(1)
    expect(@food_truck.inventory).to eq({@item1 => 30})

    @food_truck.stock(@item1, 25)

    expect(@food_truck.inventory).to be_instance_of Hash
    expect(@food_truck.inventory.size).to eq(1)
    expect(@food_truck.inventory).to eq({@item1 => 55})

    @food_truck.stock(@item2, 12)

    expect(@food_truck.inventory).to be_instance_of Hash
    expect(@food_truck.inventory.size).to eq(2)
    expect(@food_truck.inventory).to eq({
      @item1 => 55,
      @item2 => 12
      })
  end

  it "can find stock given inventory" do
    expect(@food_truck.check_stock(@item1)).to be_instance_of Integer
    expect(@food_truck.check_stock(@item1)).to eq(0)

    @food_truck.stock(@item1, 30)

    expect(@food_truck.check_stock(@item1)).to be_instance_of Integer
    expect(@food_truck.check_stock(@item1)).to eq(30)

    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to be_instance_of Integer
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end

end
