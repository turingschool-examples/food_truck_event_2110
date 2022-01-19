require './lib/event'

describe Event do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")

    @event = Event.new("South Pearl Street Farmers Market")

    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)

  end
  describe 'initialize' do
    it 'exists' do
      expect(@event).to be_a(Event)
    end
    it 'has_attributes' do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
    end
  end

  describe 'methods' do

    describe '# add_food_truck' do
      it 'adds a food truck to the food_trucks array' do
        expect(@event.food_trucks).to eq([])
        @event.add_food_truck(@food_truck1)
        expect(@event.food_trucks).to eq([@food_truck1])
        @event.add_food_truck(@food_truck2)
        expect(@event.food_trucks).to eq([@food_truck1, @food_truck2])
        @event.add_food_truck(@food_truck3)
        expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
      end
    end

    describe '#food_truck_names' do
      before(:each) do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
      end

      it 'returns an array' do
        expect(@event.food_truck_names).to be_a(Array)
      end

      it 'returns an array of Strings' do
        expect(@event.food_truck_names.all?{|name| name.class == String}).to eq(true)
      end

      it 'returns an Array of all the food truck names' do
        expected = ["Ba-Nom-a-Nom", "Palisade Peach Shack", "Rocky Mountain Pies"]
        expect(@event.food_truck_names).to eq(expected)
      end
    end

    describe '#food_trucks_that_sell' do
      before(:each) do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
      end

      it 'returns an Array' do
        expect(@event.food_trucks_that_sell('Peach Pie (Slice)')).to be_a(Array)
      end

      it 'returns an Array of FoodTrucks' do
        expect(@event.food_trucks_that_sell('Peach Pie (Slice)').all?{|food_truck| food_truck.class == FoodTruck}).to eq(true)
      end

      it 'returns correct Array sorted by names' do
        expect(@event.food_trucks_that_sell('Peach Pie (Slice)')).to eq([@food_truck1, @food_truck3])
      end
    end
  end
end
