require './lib/item'
require './lib/food_truck'
require './lib/event'

describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

  end

  describe '#initialize' do
     it 'returns an instance of Event' do
       expect(@event).to be_a Event
     end

     it 'returns the name of the event' do
       expect(@event.name).to eq("South Pearl Street Farmers Market")
     end

     it 'returns the list of food trucks at the event' do
       expect(@event.food_trucks).to eq([])
     end
  end
end
