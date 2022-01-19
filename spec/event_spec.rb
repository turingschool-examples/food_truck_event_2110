require_relative './spec_helper'

RSpec.describe Event do
  let (:event) {Event.new("South Pearl Street Farmers Market")}
  let (:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
  let (:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let (:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let (:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let (:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let (:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let (:food_truck3) {FoodTruck.new("Palisade Peach Shack")}

  it 'exists' do
    expect(event).to be_instance_of Event
  end

  it 'initializes with a name and no food trucks' do
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end

  it 'can add food trucks to food_trucks array' do
    expect(event.food_trucks).to eq([])
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    
    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
  end



end
