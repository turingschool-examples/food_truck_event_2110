require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

  it 'exists' do
    expect(food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'has attributes' do
    expect(food_truck.name).to eq('Rocky Mountain Pies')
    expect(food_truck.inventory).to eq({})
  end

  it 'can check the stock for items' do
    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it 'can add items fo the stock' do
    expect(food_truck.check_stock(item1)).to eq(0)

    food_truck.stock(item1, 30)

    expect(food_truck.check_stock(item1)).to eq(30)

    food_truck.stock(item1, 25)

    expect(food_truck.check_stock(item1)).to eq(55)
  end

  it 'will update the inventory with stocked items' do
    food_truck.stock(item1, 30)

    expect(food_truck.inventory).to eq({item1 => 30})

    food_truck.stock(item1, 25)
    food_truck.stock(item2, 12)

    expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
  end
end
