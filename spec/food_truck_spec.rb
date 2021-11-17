require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:food_truck1) { FoodTruck.new('Rocky Mountain Pies') }
  let(:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom') }
  let(:food_truck3) { FoodTruck.new('Palisade Peach Shack') }
  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }
  let(:item3) { Item.new({ name: 'Peach-Raspberry Nice Cream', price: '$5.30' }) }
  let(:item4) { Item.new({ name: 'Banana Nice Cream', price: '$4.25' }) }
  it 'exists' do
    actual = food_truck1
    expected = FoodTruck

    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it 'has a name' do
      actual = food_truck1.name
      expected = 'Rocky Mountain Pies'

      expect(actual).to eq(expected)
    end
    it 'has inventory' do
      actual = food_truck1.inventory
      expected = {}

      expect(actual).to eq(expected)
    end
  end
  describe '#stock/2' do
    it 'can stock an item' do
      food_truck1.stock(item1, 30)
      actual = food_truck1.inventory
      expected = { item1 => 30 }

      expect(actual).to eq(expected)

      food_truck1.stock(item2, 12)
      actual = food_truck1.inventory
      expected =
        {
          item1 => 30,
          item2 => 12
        }

      expect(actual).to eq(expected)
    end
  end
  describe '#check_stock/1' do
    it 'can look up an items stock' do
      actual = food_truck1.check_stock(item1)
      expected = 0

      expect(actual).to eq(expected)

      food_truck1.stock(item1, 30)
      actual = food_truck1.check_stock(item1)
      expected = 30

      expect(actual).to eq(expected)

      food_truck1.stock(item1, 25)
      actual = food_truck1.check_stock(item1)
      expected = 55

      expect(actual).to eq(expected)
    end
  end
  describe 'potential_revenue' do
    it 'calculates the sum of all the menu' do
      food_truck1.stock(item1, 30)
      food_truck1.stock(item2, 12)
      actual = food_truck1.potential_revenue
      expected = 142.50
      expect(actual).to eq(expected)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)

      actual = food_truck2.potential_revenue
      expected = 345.00
      expect(actual).to eq(expected)
    end
  end
  describe 'menu_list' do
    it 'reads the menu' do
      food_truck1.stock(item1, 30)
      food_truck1.stock(item2, 12)
      actual = food_truck1.menu_list
      expected = [item1, item2]
    end
  end
end
