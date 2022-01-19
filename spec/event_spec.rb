require_relative './spec_helper'

RSpec.describe Event do
  let (:event) {Event.new("South Pearl Street Farmers Market")}

  it 'exists' do
    expect(event).to be_instance_of Event
  end

  it 'initializes with a name and no food trucks' do
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end

end
