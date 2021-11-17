require './lib/item'
require './lib/food_truck'

describe Food_truck do
  it 'exists' do
    food_truck = Food_truck.new("Rocky Mountain Pies")
    expect(food_truck).to be_an_instance_of(Food_truck)
  end

  it 'has a name' do
    food_truck = Food_truck.new("Rocky Mountain Pies")
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has inventory' do
    food_truck = Food_truck.new("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  it 'can stock items' do
    food_truck = Food_truck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(food_truck.check_stock(item1)).to eq(0)
    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to eq({item1 => 30})
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock(item1)).to eq(55)
    food_truck.stock(item2, 12)
    expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
  end
end
