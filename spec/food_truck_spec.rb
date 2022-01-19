require './lib/food_truck'
require './lib/item'
RSpec.describe FoodTruck do

  it "exists" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_instance_of(FoodTruck)
  end

  it "has name" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "can have inventory" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to be_instance_of(Hash)
  end

  it "can have inventory" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    food_truck.stock(item1, 30)

    expect(food_truck.check_stock(item1)).to eq(30)
  end

end
