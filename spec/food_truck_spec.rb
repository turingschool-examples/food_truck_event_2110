require './lib/food_truck'


RSpec.describe Foodtruck do
  describe "Iteration 1" do
    before :each do
      @food_truck = FoodTruck.new("Rocky Mountain Pies")
    end

    it "exists" do
      expect(@food_truck).to be_a(Foodtruck)
    end

    it "checks the attributes " do
      expect(@food_truck.name).to eq("Apple Pie (Slice)")
      expect(@food_truck.inventory).to eq({})
      expect(@food_truck.check_stock).to eq(0)
    end
  end 
end
