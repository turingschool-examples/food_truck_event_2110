require './lib/item'
require './lib/food_truck'
require './lib/event'

 RSpec.describe Event do
 	before(:each) do
 		@event = Event.new("South Pearl Street Farmers Market")
 	end

    context 'Iteration 2' do

     	it 'exists' do
     		expect(@event).to be_a(Event)
     	end

     	xit 'has attributes' do
     		expect(@event.attribute).to eq(attribute)
     	end

    end
 end
