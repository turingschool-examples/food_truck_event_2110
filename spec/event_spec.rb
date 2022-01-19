require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
  end
  it 'is initialized with a name and an empty collection of food trucks' do
    expect(@event).to be_an Event
    expect(@event.name).to be_a String
    expect(@event.name).to eq "South Pearl Street Farmers Market"
    expect(@event.food_trucks).to be_an Array
    expect(@event.food_trucks).to be_empty

  end
end
