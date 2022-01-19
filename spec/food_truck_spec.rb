require './lib/item'
require './lib/food_truck'
require 'pry'

RSpec.describe FoodTruck do
  describe "#iteration 1 - food_truck" do
    it 'can create a food truck' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
    end
  end
end
