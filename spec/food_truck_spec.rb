require './lib/food_truck'
RSpec.describe FoodTruck do

  it "exists" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_instance_of(FoodTruck)
  end

  it "has name" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

end
