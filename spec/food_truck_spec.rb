require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end
  it 'is initialized with something or other' do
    expect(@food_truck).to be_instance_of FoodTruck
  end
 end
