require './lib/food_truck'
require './lib/item'
require './lib/event'

RSpec.describe do FoodTruck
  context 'iteration1' do
    let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

    it 'exists' do
      expect(food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
      expect(food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'inventory' do
      expect(food_truck.inventory).to eq({})
    end

    it 'checks stock' do
      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it 'stocks' do
      food_truck.stock(item1, 30)
      output = {item1 => 30}
      expect(food_truck.inventory).to eq(output)
      expect(food_truck.check_stock(item1)).to eq(30)
    end

    it 'stocks twice' do
      food_truck.stock(item1, 30)
      food_truck.stock(item1, 25)
      expect(food_truck.check_stock(item1)).to eq(55)
    end

    it 'stocks multiples' do
      food_truck.stock(item1, 30)
      food_truck.stock(item1, 25)
      food_truck.stock(item2, 12)
      output = {item1 => 55, item2 => 12}
      expect(food_truck.inventory).to eq(output)
    end
  end

  context 'iteration2' do
    let(:event) {Event.new("South Pearl Street Farmers Market")}
    let(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
    let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
    let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
    let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}

    it 'gives potential revenue- foodtruck1' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(food_truck1.potential_revenue).to be(148.75)
    end

    it 'gives potential revenue- foodtruck2' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(food_truck2.potential_revenue).to be(345.00)
    end

    it 'gives potential revenue- foodtruck3' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(food_truck3.potential_revenue).to be(243.75)
    end
  end
end
