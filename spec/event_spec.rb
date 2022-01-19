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
  end
end
