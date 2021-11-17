require './lib/item'
require './lib/food_truck'

RSpec.describe do
  it 'has a name' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck.name).to eq('Rocky Mountain Pies')
  end
end

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
