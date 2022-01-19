require './lib/event'
require './lib/food_truck'
require './lib/item'
require 'date'

RSpec.describe do Event
  context 'iteration 1 & 2' do
    let(:event) {Event.new("South Pearl Street Farmers Market")}
    let(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
    let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
    let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
    let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}

    it 'exists' do
      expect(event).to be_a(Event)
    end

    it 'has a name' do
      expect(event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'has no trucks' do
      expect(event.food_trucks).to eq([])
    end

    it 'has trucks' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      output = [food_truck1, food_truck2, food_truck3]
      expect(event.food_trucks).to eq(output)
    end

    it 'gives trucks names' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      output = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
      expect(event.food_trucks_names).to eq(output)
    end

    it 'gives trucks that sell item' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      output1 = [food_truck1, food_truck3]
      expect(event.food_trucks_that_sell(item1)).to eq(output1)
    end

    it 'gives trucks that sell DIFF item' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      output1 = [food_truck2]
      expect(event.food_trucks_that_sell(item4)).to eq(output1)
    end
  end

  context 'iteration 3 and 4' do
    let(:event) {Event.new("South Pearl Street Farmers Market")}
    let(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
    let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
    let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
    let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
    let(:item5) {Item.new({name: 'Onion Pie', price: '$25.00'})}

    it 'gives total inventory' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      output = {
        item1 => {
          quantity: 100,
          food_trucks: [food_truck1, food_truck3]
        },
        item2 => {
          quantity: 7,
          food_trucks: [food_truck1]
        },
        item4 => {
          quantity: 50,
          food_trucks: [food_truck2]
        },
        item3 => {
          quantity: 35,
          food_trucks: [food_truck2, food_truck3]
        }
      }

      expect(event.total_inventory).to eq(output)
    end

    it 'gives overstocked items' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.overstocked_items).to eq([item1])
    end

    it 'gives sorted items' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      output = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]
      expect(event.sorted_item_list).to eq(output)
    end

    it 'gives sorted items' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      output = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]
      expect(event.sorted_item_list).to eq(output)
    end

    it 'gives a date' do
      output = "24/02/2020"
      allow(event).to receive(:date).and_return(output)
      expect(event.date).to eq(output)
    end

    it 'sells items' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.sell(item1, 200)).to eq(false)
      expect(event.sell(item5, 1)).to eq(false)
      expect(event.sell(item4, 5)).to eq(true)
      expect(food_truck2.check_stock(item4)).to eq(45)
      expect(event.sell(item1, 40)).to eq(true)
      expect(food_truck1.check_stock(item1)).to eq(0)
      expect(food_truck3.check_stock(item1)).to eq(60)
    end
  end
end
