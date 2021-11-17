require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe "Event" do
  before(:each) do
    @event       = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1       = Item.new({name: 'Peach Pie (Slice)',
                             price: "$3.75"})
    @item2       = Item.new({name: 'Apple Pie (Slice)',
                             price: '$2.50'})
    @item3       = Item.new({name: "Peach-Raspberry Nice Cream",
                             price: "$5.30"})
    @item4       = Item.new({name: "Banana Nice Cream",
                             price: "$4.25"})
  end

  it "exists" do
    expect(@event).to be_a Event
  end

  it "has readable attributes" do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
    expect(@event.food_trucks).to eq([])
  end

  it "can add food trucks to food_trucks array" do
    @event.add_food_truck(@food_truck1)

    expect(@event.food_trucks).to eq([@food_truck1])

    @event.add_food_truck(@food_truck2)

    expect(@event.food_trucks).to eq([@food_truck1, @food_truck2])
  end
end
