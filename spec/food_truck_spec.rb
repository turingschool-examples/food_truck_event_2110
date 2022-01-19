require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end
  it 'is initialized with a name' do
    expect(@food_truck).to be_instance_of FoodTruck
    expect(@food_truck.name).to eq "Rocky Mountain Pies"
  end
 end
