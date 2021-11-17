require './lib/item'
require './lib/food_truck'
require './lib/event'
# pry(main)> food_truck1.stock(item1, 35)
# pry(main)> food_truck1.stock(item2, 7)
# pry(main)> food_truck2.stock(item4, 50)
# pry(main)> food_truck2.stock(item3, 25)
# pry(main)> food_truck3.stock(item1, 65)
# pry(main)> event.add_food_truck(food_truck1)
# pry(main)> event.add_food_truck(food_truck2)
# pry(main)> event.add_food_truck(food_truck3)
# pry(main)> event.food_trucks
# #=> [#<FoodTruck:0x00007fe1348a1160...>, #<FoodTruck:0x00007fe1349bed40...>, #<FoodTruck:0x00007fe134910650...>]
# pry(main)> event.food_truck_names
# #=> ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
# pry(main)> event.food_trucks_that_sell(item1)
# #=> [#<FoodTruck:0x00007fe1348a1160...>, #<FoodTruck:0x00007fe134910650...>]
# pry(main)> event.food_trucks_that_sell(item4)
# #=> [#<FoodTruck:0x00007fe1349bed40...>]
# pry(main)> food_truck1.potential_revenue
# #=> 148.75
# pry(main)> food_truck2.potential_revenue
# #=> 345.00
# pry(main)> food_truck3.potential_revenue
# #=> 243.75
RSpec.describe Event do
  let!(:item1){Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let!(:item2){Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let!(:item3){Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let!(:item4){Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let!(:food_truck1){FoodTruck.new("Rocky Mountain Pies")}
  let!(:food_truck2){FoodTruck.new("Ba-Nom-a-Nom")}
  let!(:food_truck3){FoodTruck.new("Palisade Peach Shack")}
  let!(:event){Event.new("South Pearl Street Farmers Market")}


  describe '#initialize' do
    it "exists" do
      expect(event).to be_a Event
    end

    it "has attributes" do
      expect(event.name).to eq "South Pearl Street Farmers Market"
      expect(event.food_trucks).to eq []
    end
  end
end 
