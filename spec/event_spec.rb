require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }
  let(:item3) { Item.new({ name: 'Peach-Raspberry Nice Cream', price: '$5.30' }) }
  let(:item4) { Item.new({ name: 'Banana Nice Cream', price: '$4.25' }) }
  let(:food_truck1) { FoodTruck.new('Rocky Mountain Pies') }
  let(:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom') }
  let(:food_truck3) { FoodTruck.new('Palisade Peach Shack') }
  let(:event) { Event.new('South Pearl Street Farmers Market') }
  it 'exists' do
    actual = event
    expected = Event

    expect(actual).to be_a(expected)
  end
  describe '#attributes' do
    it '#has a name' do
      actual = event.name
      expected = 'South Pearl Street Farmers Market'

      expect(actual).to eq(expected)
    end
    it 'has food trucks' do
      actual = event.food_trucks
      expected = []

      expect(actual).to eq(expected)
    end
  end
  describe '#add_food_truck' do
    it 'can add food trucks' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      actual = event.food_trucks
      expected = [food_truck1, food_truck2]

      expect(actual).to eq(expected)
    end
  end
  describe '#food_truck_names' do
    it 'lists all names of the food truck' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      actual = event.food_truck_names
      expected = ['Rocky Mountain Pies', 'Ba-Nom-a-Nom', 'Palisade Peach Shack']

      expect(actual).to eq(expected)
    end
  end
  describe '#food_trucks_that_sell\1' do
    it 'lists all the trucks that carry that item' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      actual = event.food_trucks_that_sell(item1)
      expected = [food_truck1, food_truck3]

      expect(actual).to eq(expected)
    end
  end
  describe '#sorted_item_list' do
    it 'returns a list of all names of items a-z' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      actual = event.sorted_item_list
      expected = ['Apple Pie (Slice)', 'Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream']

      expect(actual).to eq(expected)
    end
  end
  describe '#total_quantity/1' do
    it 'returns quantity of item at all trucks' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      actual = event.total_quantity(item1)
      expected = 100

      expect(actual).to eq(expected)
    end
  end
  describe '#total_inventory' do
    it 'returns a diagram of item pointing to quantity and which trucks carry that item' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      actual = event.total_inventory
      expected =
        {
          item1 => { quantity: 100, food_trucks: [food_truck1, food_truck3] },
          item2 => { quantity: 7, food_trucks: [food_truck1] },
          item3 => { quantity: 35, food_trucks: [food_truck2, food_truck3] },
          item4 => { quantity: 50, food_trucks: [food_truck2] }

        }

      expect(actual).to eq(expected)
    end
  end
  describe '#overstocked_items' do
    it 'returns items that have quantity > 50 and sold at multiple food trucks' do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      food_truck3.stock(item4, 1)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      actual = event.overstocked_items
      expected = [item1, item4]

      expect(actual).to eq(expected)
    end
  end
  # describe '#sell/1' do
  #   it 'returns true if they can sell and depeletes quantity from the foodtrucks at event' do
  #     food_truck1.stock(item1, 35)
  #     food_truck1.stock(item2, 7)
  #     food_truck2.stock(item4, 50)
  #     food_truck2.stock(item3, 25)
  #     food_truck3.stock(item1, 65)
  #     food_truck3.stock(item4, 1)
  #     event.add_food_truck(food_truck1)
  #     event.add_food_truck(food_truck2)
  #     event.add_food_truck(food_truck3)
  #
  #     actual = event.sell(item1, 90)
  #     expected = true
  #
  #     expect(actual).to eq(expected)
  #     actual = food_truck1.check_stock(item1)
  #     expected = 0
  #
  #     expect(actual).to eq(expected)
  #     actual = food_truck3.check_stock(item1)
  #     expected = 10
  #
  #     expect(actual).to eq(expected)
  #   end
  # end
end
