require './lib/item'
require './lib/food_truck'

RSpec.describe '#food_truck' do
  it 'exist' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck).to be_a(FoodTruck)
  end

  it 'has a name' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck.name).to eq('Rocky Mountain Pies')
  end

  it 'has an inventory' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck.inventory).to eq({})
  end

  it 'has no stock' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it 'has stock of item 1' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    food_truck.stock(item1, 30)
    expect(food_truck.check_stock(item1)).to eq(30)
    expect(food_truck.inventory).to eq({ item1 => 30 })
  end

  it 'has stock of item 2' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    food_truck.stock(item1, 30)
    expect(food_truck.check_stock(item1)).to eq(30)
    expect(food_truck.inventory).to eq({ item1 => 30 })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock(item1)).to eq(55)
    food_truck.stock(item2, 12)
    expect(food_truck.inventory).to eq({ item1 => 55, item2 => 12 })
  end

  xit 'can calculate its potential potential_revenue' do
    event = Event.new('South Pearl Street Farmers Market')

    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    item3 = Item.new({ name: 'Peach-Raspberry Nice Cream', price: '$5.30' })
    item4 = Item.new({ name: 'Banana Nice Cream', price: '$4.25' })
    expect(item1).to be_a(Item)
    expect(item2).to be_a(Item)
    expect(item3).to be_a(Item)
    expect(item4).to be_a(Item)

    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    expect(food_truck1).to be_a(FoodTruck)

    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    expect(food_truck2).to be_a(FoodTruck)

    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    expect(food_truck3).to be_a(FoodTruck)

    expect(food_truck1.potential_revenue).to eq(148.75)
    expect(food_truck2.potential_revenue).to eq(345.00)
    expect(food_truck3.potential_revenue).to eq(243.75)
  end
end
