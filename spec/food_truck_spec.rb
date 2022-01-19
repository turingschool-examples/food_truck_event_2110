require_relative './spec_helper'

RSpec.describe FoodTruck do
  let (:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

  it 'exists' do
    expect(food_truck). to be_instance_of FoodTruck
  end

  it 'initializes with a name' do
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'begins with no inventory' do
    expect(food_truck.inventory).to eq({})
  end

end
