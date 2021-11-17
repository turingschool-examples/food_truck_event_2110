require './lib/event'


describe Event do

  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @item5 = Item.new({name: 'Onion Pie', price: '$25.00'})
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @food_truck3.stock(@item1, 65)
    @food_truck3.stock(@item3, 10)
    allow(@event).to receive(:date).and_return("24/02/2020")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@event).to be_a(Event)
    end
    it 'has attributes' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
      expect(@event.date).to eq("24/02/2020")
    end
  end

  describe '#add_food_truck' do
    it 'adds a food truck to the event' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end
  end

  describe '#food_truck_names' do
    it 'returns the names of the food trucks' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns an array of trucks that sell given item' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end
  end

  describe '#items' do
    it 'returns an array of items sold at the event' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.items).to eq([@item1, @item2, @item4, @item3])
    end
  end

  describe '#sorted_item_list' do
    it 'returns an array of all items sold at the event by name' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end
  end

  describe '#total_inventory' do
    it 'returns the total inventory' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expected = {
        @item1 => {
          quantity: 100,
          food_trucks: [@food_truck1, @food_truck3]
        },
        @item2 => {
          quantity: 7,
          food_trucks: [@food_truck1]
        },
        @item4 => {
          quantity: 50,
          food_trucks: [@food_truck2]
        },
        @item3 => {
          quantity: 35,
          food_trucks: [@food_truck2, @food_truck3]
        },
      }
      expect(@event.total_inventory).to eq(expected)
    end
  end

  describe '#overstocked_items' do
    it 'returns items that are sold by 2+ trucks and with quantity greater than 50' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.overstocked_items).to eq([@item1])
    end
  end

end
