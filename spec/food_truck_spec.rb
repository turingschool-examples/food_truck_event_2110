require './lib/item'
require './lib/food_truck'
require 'pry'

RSpec.describe FoodTruck do
  describe "#iteration 1 - food_truck" do
    it 'can create a food truck' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
    end

    it 'can read foodtrucks names' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'has inventory as a hash' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to eq({})
    end
  end
end
