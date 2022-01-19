require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
  end
  it 'is initialized with a name' do
    expect(@event).to be_instance_of Event
    expect(@event.name).to eq "South Pearl Street Farmers Market"
  end
end
