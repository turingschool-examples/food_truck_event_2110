require './lib/item'
#=> true

require './lib/food_truck'
#=> true

require './lib/event'
#=> true

event = Event.new("South Pearl Street Farmers Market")
#=> #<Event:0x00007fe134933e20...>

item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
#=> #<Item:0x007f9c56740d48...>

item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
#=> #<Item:0x007f9c565c0ce8...>

item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
#=> #<Item:0x007f9c562a5f18...>

item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
#=> #<Item:0x007f9c56343038...>

food_truck1 = FoodTruck.new("Rocky Mountain Pies")
#=> #<FoodTruck:0x00007fe1348a1160...>

food_truck1.stock(item1, 35)

food_truck1.stock(item2, 7)

food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

food_truck2.stock(item4, 50)

food_truck2.stock(item3, 25)

food_truck3 = FoodTruck.new("Palisade Peach Shack")

food_truck3.stock(item1, 65)

food_truck3.stock(item3, 10)

event.add_food_truck(food_truck1)

event.add_food_truck(food_truck2)

event.add_food_truck(food_truck3)

puts "total_inventory = #{event.total_inventory}"

p event.overstocked_items

p event.sorted_item_list
