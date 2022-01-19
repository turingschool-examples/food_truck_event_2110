require './lib/food_truck'
RSpec.describe do FoodTruck
  context 'iteration1' do
    let(:food_truck) {food_truck = FoodTruck.new("Rocky Mountain Pies")}


    it 'exists' do
      expect(food_truck).to be_a(FoodTruck)
    end
  end
end
