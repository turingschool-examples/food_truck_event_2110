require './lib/item'
require './lib/food_truck'

RSpec.describe do
  it 'has a name and price' do
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    expect(item2.name).to eq('Apple Pie (Slice)')
    expect(item2.price).to eq('$2.50')
  end
end
# food_truck = FoodTruck.new("Rocky Mountain Pies")
# #<FoodTruck:0x00007f85683152f0...>
#
# food_truck.name
# "Rocky Mountain Pies"
#
# food_truck.inventory
# {}
#
# food_truck.check_stock(item1)
# 0
#
# food_truck.stock(item1, 30)
#
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
