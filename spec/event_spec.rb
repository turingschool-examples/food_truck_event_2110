require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do

  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")

    @food_truck.stock(@item1, 35)
    @food_truck.stock(@item2, 7)

    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)

    @food_truck3.stock(@item1, 65)

    @event = Event.new("South Pearl Street Farmers Market")
  end

  context 'initialize tests' do
    it 'exists' do
      expect(@event).to be_instance_of(Event)
    end

    it 'has a name' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'initializes empty @food_trucks attributes' do
      expect(@event.food_trucks).to eq([])
    end
  end

  context 'class methods' do
    it 'can #add_food_truck to @food_trucks[]' do
      @event.add_food_truck(@food_truck)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expected_array = [@food_truck, @food_truck2, @food_truck3]
      expect(@event.food_trucks).to eq(expected_array)
    end


    it 'returns all #food_truck_names' do
      @event.add_food_truck(@food_truck)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expected_array = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
      expect(@event.food_truck_names).to eq(expected_array)
    end

    it 'returns #food_trucks_that_sell(item_obj)' do
      @event.add_food_truck(@food_truck)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end

    it 'can return #sorted_item_list' do
      @event.add_food_truck(@food_truck)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expected_array = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]

      expect(@event.sorted_item_list).to eq(expected_array)
    end

    it 'can return #total_inventory' do
      expected_hash = {

        @item1 => {quantity: 100, food_trucks: [@food_truck, @food_truck3]},
        @item2 => {quantity: 7, food_trucks: [@food_truck]},
        @item3 => {quantity: 25, food_trucks: [@food_truck2]},
        @item4 => {quantity: 50, food_trucks: [@food_truck2]}


      }

      expect(@event.total_inventory).to eq(expected_hash)
    end

    it 'can return #overstocked_items' do
      expected_array = [@item1]
      expect(@event.overstocked_items).to eq(expected_array)
    end
  end
end
