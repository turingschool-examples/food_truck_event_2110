require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'pry'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
  end

  it 'exists and has a name' do
    expect(@event).to be_a(Event)
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

  it "has an empty array of trucks" do
    expect(@event.food_trucks).to eq([])
  end

  context "with trucks" do
    before(:each) do
      @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      @food_truck3 = FoodTruck.new("Palisade Peach Shack")
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
    end

    it "returns the current array of trucks at event" do
      expected = []
      expected << @food_truck1
      expected << @food_truck2
      expected << @food_truck3
      expect(@event.food_trucks).to eq(expected)
    end

    it 'returns an array of food truck names' do
      expected = []
      expected << @food_truck1.name
      expected << @food_truck2.name
      expected << @food_truck3.name
      expect(@event.food_trucks_names).to eq(expected)
    end

    xit 'returns an array of trucks which sell a specific item' do
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end

    xit 'can calculate a food_trucks #potential_revenue' do
      expect(@food_truck1.potential_revenue).to eq(148.75)
      expect(@food_truck2.potential_revenue).to eq(345.00)
      expect(@food_truck1.potential_revenue).to eq(243.75)
    end
  end
end
