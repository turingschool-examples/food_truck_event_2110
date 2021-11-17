require './lib/item'
require './lib/food_truck'

describe Food_truck do
  it 'exists' do
    food_truck = Food_truck.new("Rocky Mountain Pies")
    expect(food_truck).to be_an_instance_of(Food_truck)
  end

  it 'has a name' do
    food_truck = Food_truck.new("Rocky Mountain Pies")
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end


end
