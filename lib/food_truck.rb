require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_an_instance_of(Item)
  end

  it 'has attributes' do
    expect(@food_truck.name).to eq('Rocky Mountain Pies')
    expect(@food_truck.inventrory).to eq({})
  end
end
