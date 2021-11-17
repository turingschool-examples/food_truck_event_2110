require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
  end

  it 'exists' do
    expect(@event).to be_a Event
  end

  it 'has attributes' do
    expect(@event.name).to eq "South Pearl Street Farmers Market"
    expect(@event.food_trucks).to eq([])
  end

  describe '#tests with food trucks' do
    before(:each) do
      @food_truck1 = FoodTruck.new("Rocky Mountain Pies")

      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})

      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      @food_truck1.stock(@item1, 35)

      @food_truck1.stock(@item2, 7)

      @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

      @food_truck2.stock(@item4, 50)

      @food_truck2.stock(@item3, 25)

      @food_truck3 = FoodTruck.new("Palisade Peach Shack")

      @food_truck3.stock(@item1, 65)

      @event.add_food_truck(@food_truck1)

      @event.add_food_truck(@food_truck2)

      @event.add_food_truck(@food_truck3)
    end

    it 'lists array of food truck' do
      expect(@event.food_trucks).to be_a Array
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end

    it 'returns a list of food truck names' do
      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'returns list of food trucks with item in stock' do
      expect(@event.food_trucks_that_sell(@item1)).to be_a Array
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item2)).to eq([@food_truck1])
      expect(@event.food_trucks_that_sell(@item3)).to eq([@food_truck2])
    end

    it 'checks potential revenue again' do
      expect(@food_truck1.potential_revenue).to eq 148.75

      expect(@food_truck2.potential_revenue).to eq 345.00

      expect(@food_truck3.potential_revenue).to eq 243.75
    end

    it 'checks all items available at event' do
      expect(@event.sorted_items_list).to be_a Array
      expect(@event.sorted_items_list).to eq([@item2.name, @item4.name, @item1.name, @item3.name])
    end

    it 'tracks total inventory' do
      expect(@event.total_inventory).to be_a Hash
      expect(@event.total_inventory.keys).to eq([@item1, @item2 ,@item3 ,@item4])
      expect(@event.total_inventory.values[0]).to be_a Hash
      expect(@event.total_inventory.values[0]).to be_a Hash
    end


    xit 'makes list of overstocked items' do
      expect(@event.overstocked_items).to be_a Array
      expect(@event.overstocked_items).to eq([item1])
    end
  end
end
