require './lib/food_truck'
require './lib/item'
require './lib/event'
require 'rspec'

######## ITERATION 2 #########
describe Event do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @event = Event.new("South Pearl Street Farmers Market")
  end

  it 'exists' do
    expect(@event).to be_instance_of(Event)
  end

  it 'has attributes' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
    expect(@event.food_trucks).to eq([])
  end
end
