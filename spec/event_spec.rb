require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'pry'

RSpec.describe Event do
  describe '#iteration 2' do
    it 'can create an event' do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event).to be_a(Event)
    end

    it 'can read the name of an event' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'can hold the names of foodtrucks at the event' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event.food_trucks).to eq([])
    end
  end
end
