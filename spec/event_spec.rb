require_relative '../lib/item'
require_relative '../lib/food_truck'
require_relative '../lib/event'

RSpec.describe Event do 
  describe 'iteration2' do
    let(:item1) { Item.new({name: 'Peach Pie (Slice)', price: "$3.75"}) }
    let(:item2) { Item.new({name: 'Apple Pie (Slice)', price: '$2.50'}) }
    let(:item3) { Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
    let(:item4) { Item.new({name: 'Banana Nice Cream', price: '$4.25'}) }
    let(:item5) { Item.new({name: 'Taco', price: '$4.00'}) }
  
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
  
    let(:event) { Event.new("South Pearl Street Farmers Market") }
  
    let(:populate_event) do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
    end

    describe '#initialize' do
      it 'exists' do
        expect(event).to be_a(Event)
      end

      it 'has attributes' do
        expect(event.name).to eq("South Pearl Street Farmers Market")
        expect(event.food_trucks).to eq([])
      end
    end

    describe '#add_food_truck' do
      it 'can add FoodTruck objs to food_trucks attribute' do
        populate_event

        expected = [food_truck1, food_truck2, food_truck3]
        expect(event.food_trucks).to eq(expected)
      end
    end

    describe '#food_truck_names' do
      it 'return array of food truck obj names from food_trucks attribute' do
        populate_event

        expected = [food_truck1.name, food_truck2.name, food_truck3.name]
        expect(event.food_truck_names).to eq(expected)
      end
    end

    describe '#food_trucks_that_sell' do
      it 'can return array of FoodTruck obj that sell selected item' do
        stock_items
        populate_event

        expected = [food_truck1, food_truck3]
        expect(event.food_trucks_that_sell(item1)).to eq(expected)

        expected = [food_truck2]
        expect(event.food_trucks_that_sell(item4)).to eq(expected)

        expect(event.food_trucks_that_sell(item5)).to eq([])
      end
    end
  end

  describe 'iteration3' do
    let(:item1) { Item.new({name: 'Peach Pie (Slice)', price: "$3.75"}) }
    let(:item2) { Item.new({name: 'Apple Pie (Slice)', price: '$2.50'}) }
    let(:item3) { Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
    let(:item4) { Item.new({name: 'Banana Nice Cream', price: '$4.25'}) }
  
    let(:food_truck1) { FoodTruck.new('Rocky Mountain Pies') }
    let(:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom') }
    let(:food_truck3) { FoodTruck.new('Palisade Peach Shack') }
  
    let(:stock_items) do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)

      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)
    end
  
    let(:event) { Event.new("South Pearl Street Farmers Market") }
  
    let(:populate_event) do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
    end

    describe '#item_list' do
      it 'can return unique list of all items unsorted' do
        stock_items
        populate_event
        
        expected = [item1, item2, item4, item3]
        expect(event.item_list).to eq(expected)
      end
    end

    describe '#total_inventory' do
      it 'can return a hash of items with values of quantity and food trucks that carry the item' do
        stock_items
        populate_event

        expected = {
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
                             },
                   }
        expect(event.total_inventory).to eq(expected)
      end
    end

    describe '#overstocked_items' do
      it 'can return array of overstocked items' do
        stock_items
        populate_event

        expect(event.overstocked_items).to eq([item1])
      end
    end

    describe '#sorted_item_list' do
      it 'can return array of sorted item names' do
        stock_items
        populate_event

        expected = [item2.name, item4.name, item1.name, item3.name]
        expect(event.sorted_item_list).to eq(expected)
      end
    end
  end

  describe 'iteration4' do
    let(:item1) { Item.new({name: 'Peach Pie (Slice)', price: "$3.75"}) }
    let(:item2) { Item.new({name: 'Apple Pie (Slice)', price: '$2.50'}) }
    let(:item3) { Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
    let(:item4) { Item.new({name: 'Banana Nice Cream', price: '$4.25'}) }
    let(:item5) { Item.new({name: 'Onion Pie', price: '$25.00'}) }
  
    let(:food_truck1) { FoodTruck.new('Rocky Mountain Pies') }
    let(:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom') }
    let(:food_truck3) { FoodTruck.new('Palisade Peach Shack') }
  
    let(:stock_items) do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)

      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      
      food_truck3.stock(item1, 65)
      food_truck3.stock(item3, 10)
    end
  
    let(:event) { Event.new("South Pearl Street Farmers Market") }
  
    let(:populate_event) do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
    end

    describe '#date' do
      it 'can return todays date' do
        allow(Date).to receive(:today).and_return(Date.new(2020,02,24))
        expect(event.date).to eq('24/02/2020')
      end
    end

    describe '#sell' do
      it 'will not sell if not enough quantity' do
        stock_items
        populate_event

        expect(event.sell(item1, 200)).to eq(false)
      end

      it 'will not sell if item is not carried by trucks' do
        stock_items
        populate_event

        expect(event.sell(item5, 1)).to eq(false)
      end

      it 'will sell items from one truck if they have quantity' do
        stock_items
        populate_event

        expect(event.sell(item4, 5)).to eq(true)
        expect(food_truck2.check_stock(item4)).to eq(45)
      end

      it 'will sell items from multiple trucks if they have quantity' do
        stock_items
        populate_event

        expect(event.sell(item1, 40)).to eq(true)
        expect(food_truck1.check_stock(item1)).to eq(0)
        expect(food_truck3.check_stock(item1)).to eq(60)
      end
    end
  end
end