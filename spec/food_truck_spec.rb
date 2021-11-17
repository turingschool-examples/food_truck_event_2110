require_relative '../lib/item'
require_relative '../lib/food_truck'

RSpec.describe FoodTruck do 
  describe 'iteration 1-2' do
    let(:item1) { Item.new({name: 'Peach Pie (Slice)', price: "$3.75"}) }
    let(:item2) { Item.new({name: 'Apple Pie (Slice)', price: '$2.50'}) }
    let(:item3) { Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
    let(:item4) { Item.new({name: 'Banana Nice Cream', price: '$4.25'}) }
    let(:item5) { Item.new({name: 'Taco', price: '$4.00'}) }
  
    let(:food_truck) { FoodTruck.new('Rocky Mountain Pies') }
    let(:food_truck1) { FoodTruck.new('Rocky Mountain Pies') }
    let(:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom') }
    let(:food_truck3) { FoodTruck.new('Palisade Peach Shack') }

    let(:stock_items) do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)

      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      
      food_truck3.stock(item1, 65)
    end

    describe '#initialize' do
      it 'exists' do
        expect(food_truck).to be_a(FoodTruck)
      end

      it 'has attributes' do
        expect(food_truck.name).to eq('Rocky Mountain Pies')
        expect(food_truck.inventory).to eq({})
      end
    end

    describe '#check_stock' do
      it 'can return 0 stock for items not in stock' do
        expect(food_truck.check_stock(item1)).to eq(0)
      end
    end

    describe '#stock' do
      it 'can add new items and quantities to the stock' do
        food_truck.stock(item1, 30)
        
        expect(food_truck.inventory).to eq({item1 => 30})
        expect(food_truck.check_stock(item1)).to eq(30)
      end
      
      it 'can add additional quantity to current items' do
        food_truck.stock(item1, 30)
        food_truck.stock(item1, 25)
        
        expect(food_truck.check_stock(item1)).to eq(55)
      end
      
      it 'can have multiple items in the inventory' do
        food_truck.stock(item1, 30)
        food_truck.stock(item1, 25)
        food_truck.stock(item2, 12)
        
        expected = {item1 => 55, item2 => 12}
        expect(food_truck.inventory).to eq(expected)
      end
    end

    describe '#potential_revenue' do
      it 'can return a food trucks potential revenue for all items and their quantity' do
      stock_items

      expect(food_truck1.potential_revenue).to eq(148.75)
      expect(food_truck2.potential_revenue).to eq(345.00)
      expect(food_truck3.potential_revenue).to eq(243.75)
      end
    end
  end
end