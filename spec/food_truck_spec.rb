require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'has a name' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'starts with no inventory' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to eq({})
  end

  it 'can check its stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it 'can stock items' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to eq({item1 => 30})
    expect(food_truck.check_stock(item1)).to eq(30)
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock(item1)).to eq(55)
    food_truck.stock(item2, 12)
    expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
  end

  xit 'can calculate potential revenue' do
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    #=> #<FoodTruck:0x00007fe1348a1160...>
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    #=> #<FoodTruck:0x00007fe1349bed40...>
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    #=> #<FoodTruck:0x00007fe134910650...>
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    #=> #<Item:0x007f9c56740d48...>
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    #=> #<Item:0x007f9c565c0ce8...>
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    #=> #<Item:0x007f9c562a5f18...>
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    #=> #<Item:0x007f9c56343038...>
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65)

    expect(food_truck1.potential_revenue).to eq(148.75)
    expect(food_truck2.potential_revenue).to eq(345.00)
    expect(food_truck3.potential_revenue).to eq(243.75)
  end
end
