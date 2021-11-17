require './lib/item'
require './lib/food_truck'
require './lib/event'

describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
    @food_truck3.stock(@item3, 10)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@event).to be_instance_of(Event)
    end

    it 'has a name' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'has food_trucks' do
      expect(@event.food_trucks).to eq([])
    end
  end

  describe 'add_food_truck' do
    it 'adds food trucks to array' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end
  end

  describe 'food_trucks_that_sell' do
    it 'gives a list of food trucks with item in stock' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
    end
  end

  describe 'sorted_item_list' do
    it 'returns all items in stock listed alphabetically' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.sorted_item_list).to eq([@item2.name, @item4.name, @item1.name, @item3.name])
    end
  end

  describe 'total_inventory' do
    it 'returns total inventory of all items' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expected = {
        @item1 => {
          :qty => 100,
          :food_trucks => [@food_truck1, @food_truck3]
          },
        @item2 => {
          :qty => 7,
          :food_trucks => [@food_truck1]
          },
        @item3 => {
          :qty => 35,
          :food_trucks => [@food_truck2, @food_truck3]
          },
        @item4 => {
          :qty => 50,
          :food_trucks => [@food_truck2]
          }
        }
      expect(@event.total_inventory).to eq(expected)
    end
  end

  describe '#overstocked_items' do
    it 'lists items sold by > 1 food truck & with qty > 50' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.overstocked_items).to eq([@item1])
    end
  end

  describe '#sell' do
    it 'returns true/false depending on if item & qty sold' do
      expect(@event.sell(@item1, 200)).to eq(false)
      expect(@event.sell(@item5, 1)).to eq(false)
      expect(@event.sell(@item4, 5)).to eq(true)
    end
  end 

end
