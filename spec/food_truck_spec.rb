require './lib/item'
require './lib/food_truck'

RSpec.describe do
  it 'has a name' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck.name).to eq('Rocky Mountain Pies')
  end

  it 'has no inventory' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck.inventory).to eq({})
  end

  xit 'has no stock' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it 'has inventory' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to eq({ item1 => 30 })
  end

  it 'has stock' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    food_truck.stock(item1, 30)
    expect(food_truck.check_stock(item1)).to eq(30)
  end

  it 'has stock' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })

    food_truck.stock(item1, 30 + 25)
    expect(food_truck.check_stock(item1)).to eq(55)
  end

  it 'has stock' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    food_truck.stock(item2, 12)
    food_truck.stock(item1, 30 + 25)
    expect(food_truck.inventory).to eq({ item1 => 55, item2 => 12 })
  end
end
