require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe "Iteration 2" do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let(:event) {Event.new("South Pearl Street Farmers Market")}

  it "exists" do
    expect(event).to be_a Event
  end

  it "has attributes" do
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end
end
