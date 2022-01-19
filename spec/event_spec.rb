require './lib/item'
require './lib/food_truck'
require './lib/event'

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
    before (:each) do
      subject.add_food_truck(food_truck1)
      subject.add_food_truck(food_truck2)
      subject.add_food_truck(food_truck3)
    end

    it "can #add_food_truck" do
      expect(subject.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end

    it "can display #food_truck_names" do
      expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
      expect(subject.food_truck_names).to eq(expected)
    end
  end
end
