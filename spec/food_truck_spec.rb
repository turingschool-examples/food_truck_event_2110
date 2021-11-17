require './lib/item'
require './lib/food_truck'

describe Food_truck do
  it 'exists' do
    food_truck = Food_truck.new 
    expect(food_truck).to be_an_instance_of(Food_truck)
  end
end
