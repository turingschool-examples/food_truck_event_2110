require 'pry'
require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do

  it 'exists' do
     food_truck = FoodTruck.new("Rocky Mountain Pies")

     expect(food_truck).to be_a(FoodTruck)
     expect(food_truck.name).to eq("Rocky Mountain Pies")
  end
end

#
# item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
# #=> #<Item:0x007f9c56740d48...>
#
# item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
# #=> #<Item:0x007f9c565c0ce8...>
