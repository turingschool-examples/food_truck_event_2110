require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  xit 'exists' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_an_instance_of(Event)
  end

  xit 'has a name' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event.name).to eq("South Pearl Street Farmers Market")
  end

  xit 'starts with no foods' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event.food_trucks).to eq([])
  end
end
