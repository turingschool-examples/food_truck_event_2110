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
  # food_truck.inventory
  # {#<Item:0x007f9c56740d48...> => 30}
  #
  # food_truck.check_stock(item1)
  # 30
  #
  # food_truck.stock(item1, 25)
  #
  # food_truck.check_stock(item1)
  # 55
  #
  # food_truck.stock(item2, 12)
  #
  # food_truck.inventory
end
