require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  subject { FoodTruck.new("Rocky Mountain Pies") }
  item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

  it "exists" do
    expect(subject).to be_a FoodTruck
    expect(subject.name).to eq("Rocky Mountain Pies")
    expect(subject.inventory).to eq({})
  end
end
