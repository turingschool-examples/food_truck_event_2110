require './lib/food_truck'
RSpec.describe do FoodTruck
  context 'iteration1' do
    let(:food_truck) {food_truck = FoodTruck.new("Rocky Mountain Pies")}
    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}


    it 'exists' do
      expect(food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
      expect(food_truck.name).to be_a("Rocky Mountain Pies")
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
  end
end
