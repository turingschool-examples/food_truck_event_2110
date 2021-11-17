require './lib/item'
require './lib/food_truck'
require './lib/event'

describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event).to be_an_instance_of(Event)
  end

  it 'has attributes' do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event.name).to eq("South Pearl Street Farmers Market")
  end
end
