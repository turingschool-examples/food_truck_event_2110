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

  it "can #check_stock" do
    expect(subject.check_stock(item1)).to eq(0)
  end

  it "can #stock in @inventory" do
    subject.stock(item1, 30)
    expect(subject.inventory).to eq({item1 => 30})
    expect(subject.check_stock(item1)).to eq(30)
    subject.stock(item1, 25)
    expect(subject.check_stock(item1)).to eq(55)
    subject.stock(item2, 12)
    expect(subject.inventory).to eq({item1 => 55, item2 => 12})
  end
end
