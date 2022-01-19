require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before (:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")

    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
  end

  it "exists" do
    expect(@event).to be_instance_of Event
  end

  it "has a name" do
    expect(@event.name).to be_instance_of String
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

  it "has no food trucks by default" do
    expect(@event.food_trucks).to be_instance_of Array
    expect(@event.food_trucks.length).to eq(0)
    expect(@event.food_trucks).to eq([])
  end

  it "can add food trucks" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_trucks).to be_instance_of Array
    expect(@event.food_trucks.length).to eq(3)
    expect(@event.food_trucks).to eq([
      @food_truck1,
      @food_truck2,
      @food_truck3
      ])
  end

  it "returns food trucks by name" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_truck_names).to be_instance_of Array
    expect(@event.food_truck_names.length).to eq(3)
    expect(@event.food_truck_names).to eq([
      "Rocky Mountain Pies",
      "Ba-Nom-a-Nom",
      "Palisade Peach Shack"
      ])
  end

  it "returns food trucks that sell a given item" do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_trucks_that_sell(@item1)).to be_instance_of Array
    expect(@event.food_trucks_that_sell(@item1).length).to eq(2)
    expect(@event.food_trucks_that_sell(@item1)).to eq([
      @food_truck1,
      @food_truck3
      ])

    expect(@event.food_trucks_that_sell(@item4)).to be_instance_of Array
    expect(@event.food_trucks_that_sell(@item4).length).to eq(1)
    expect(@event.food_trucks_that_sell(@item4)).to eq([
      @food_truck2
      ])
  end
end
