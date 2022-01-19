require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'pry'

RSpec.describe Event do
  food_truck1 = FoodTruck.new("Rocky Mountain Pies")
  food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
  food_truck3 = FoodTruck.new("Palisade Peach Shack")
  item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  subject { Event.new("South Pearl Street Farmers Market") }

  it "exists" do
    expect(subject).to be_a Event
    expect(subject.name).to eq("South Pearl Street Farmers Market")
    expect(subject.food_trucks).to eq([])
  end

  context "Adding and getting data from foodtrucks in event" do
      event = Event.new("South Pearl Street Farmers Market")
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)


    it "can #add_food_truck" do
      expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end

    it "can display #food_truck_names" do
      expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
      expect(event.food_truck_names).to eq(expected)
    end

    it "checks #food_trucks_that_sell a certain item" do
      expect(event.food_trucks_that_sell('Peach Pie (Slice)')).to eq([food_truck1, food_truck3])
      expect(event.food_trucks_that_sell("Banana Nice Cream")).to eq([food_truck2])
    end

    it "can display #total_inventory" do
      expected = {
                    item1 => {
                      quantity: 100,
                      food_trucks: [food_truck1, food_truck3]
                    },
                    item2 => {
                      quantity: 7,
                      food_trucks: [food_truck1]
                    },
                    item4 => {
                      quantity: 50,
                      food_trucks: [food_truck2]
                    },
                    item3 => {
                      quantity: 35,
                      food_trucks: [food_truck2, food_truck3]
                    },
                  }
      expect(event.total_inventory).to match(expected)
    end

    it "can display #overstocked_items" do
      expect(event.overstocked_items).to eq([item1])
    end

    it "can display #sorted_item_list" do
      expected = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]
      expect(event.sorted_item_list).to eq(expected)
    end
  end
end
