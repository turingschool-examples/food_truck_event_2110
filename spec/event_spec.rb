require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  food_truck = FoodTruck.new("Rocky Mountain Pies")
  item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  subject { Event.new("South Pearl Street Farmers Market") }

  it "exists" do
    expect(subject).to be_a Event
    expect(subject.name).to eq("South Pearl Street Farmers Market")
    expect(subject.food_trucks).to eq([])
  end
end
