require './lib/item'
require './lib/food_truck'

RSpec.describe 'Item' do

 let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
 let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}


 it 'exists' do
   expect(item1).to be_a Item
   expect(item2).to be_a Item
 end

 it 'has attributes' do

   expect(item2.name).to eq("Apple Pie (Slice)")
   expect(item2.price.delete('$').to_f).to eq(2.50)
 end
end

RSpec.describe 'Food Truck' do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

 it 'exists' do
   expect(food_truck).to be_a FoodTruck
 end

 it 'has attributes' do

   expect(food_truck.name).to eq("Rocky Mountain Pies")
   expect(food_truck.inventory).to eq({})
 end

 it 'can add items to the inventory' do
  food_truck.stock(item1, 30)

  expected = {item1 => 30}

  expect(food_truck.inventory).to eq(expected)
 end

 it 'can check the inventory of an item' do

  expect(food_truck.check_stock(item1)).to eq(0)
  food_truck.stock(item1, 30)
  expect(food_truck.check_stock(item1)).to eq(30)
end
end
