require 'RSpec'
require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  let(:event){event = Event.new("South Pearl Street Farmers Market")}
  let(:food_truck){FoodTruck.new("Rocky Mountain Pies")}
  let(:item1){Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2){item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:item3){Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4){item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let(:food_truck2){food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")}
  # let{food_truck1.stock(item1, 35)}
  # let{food_truck1.stock(item2, 7)}
  # let(food_truck2.stock(item4, 50))
  # food_truck2.stock(item3, 25)

  it 'exists' do
    expect(event).to be_a(Event)
  end

  it 'has attributes' do
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end
